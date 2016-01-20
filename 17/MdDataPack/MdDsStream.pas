unit MdDsStream;

interface

uses
  Classes, Db, MdDsCustom;

type
  TMdDataFileHeader = record
    VersionNumber: Integer;
    RecordSize: Integer;
    RecordCount: Integer;
  end;

  TMdDataSetStream = class(TMdCustomDataSet)
  private
    procedure SetTableName(const Value: string);
  protected
    FDataFileHeader: TMdDataFileHeader;
    FDataFileHeaderSize, // file header size
    FRecordCount: Integer; // current number of records
    FStream: TStream; // the physical table
    FTableName: string; // table path and file name
    FFieldOffset: TList; // field offsets in the buffer
  protected
    // open and close
    procedure InternalPreOpen; override;
    procedure InternalAfterOpen; override;
    procedure InternalClose; override;
    procedure InternalInitFieldDefs; override;
    // edit support
    procedure InternalAddRecord(Buffer: Pointer; Append: Boolean); override;
    procedure InternalPost; override;
    // fields
    procedure SetFieldData(Field: TField; Buffer: Pointer); override;
    // custom dataset virutal methods
    function InternalRecordCount: Integer; override;
    procedure InternalLoadCurrentRecord(Buffer: TRecordBuffer); override; // changed from PChar
  public
    procedure CreateTable;
    function GetFieldData(Field: TField; Buffer: Pointer): Boolean; override;
  published
    property TableName: string read FTableName write SetTableName;
  end;

procedure Register;

implementation

uses
  TypInfo, IniFiles, SysUtils;

/////////////////////////////////////////////////
////// Part I:
////// Initialization, opening, and closing
/////////////////////////////////////////////////

const
  HeaderVersion = 10;

// I: open the table/file
procedure TMdDataSetStream.InternalPreOpen;
begin
  // the size of the header
  FDataFileHeaderSize := sizeOf (TMdDataFileHeader);

  // check if the file exists
  if not FileExists (FTableName) then
    raise EMdDataSetError.Create ('Open: Table file not found');

  // create a stream for the file
  FStream := TFileStream.Create (FTableName, fmOpenReadWrite);

  // initialize local data (loading the header)
  FStream.ReadBuffer (FDataFileHeader, FDataFileHeaderSize);
  if FDataFileHeader.VersionNumber <> HeaderVersion then
    raise EMdDataSetError.Create ('Illegal File Version');
  // let's read this, double check later
  FRecordCount := FDataFileHeader.RecordCount;
end;

procedure TMdDataSetStream.InternalAfterOpen;
begin
  // check the record size
  if FDataFileHeader.RecordSize <> FRecordSize then
    raise EMdDataSetError.Create ('File record size mismatch');
  // check the number of records against the file size
  if (FDataFileHeaderSize + FRecordCount * FRecordSize) <> FStream.Size then
    raise EMdDataSetError.Create ('InternalOpen: Invalid Record Size');
end;

// I: define the fields
procedure TMdDataSetStream.InternalInitFieldDefs;
var
  IniFileName, FieldName: string;
  IniFile: TIniFile;
  nFields, I, TmpFieldOffset, nSize: Integer;
  FieldType: TFieldType;
begin
  FFieldOffset := TList.Create;
  FieldDefs.Clear;
  TmpFieldOffset := 0;
  IniFilename := ChangeFileExt(FTableName, '.ini');
  Inifile := TIniFile.Create (IniFilename);
  // protect ini file
  try
    nFields := IniFile.ReadInteger ('Fields', 'Number', 0);
    if nFields = 0 then
      raise EMdDataSetError.Create ('InitFieldsDefs: 0 fields?');
    for I := 1 to nFields do
    begin
      // create the field
      FieldType := TFieldType (GetEnumValue (
        TypeInfo (TFieldType),
        IniFile.ReadString (
          'Field' + IntToStr (I), 'Type', '')));
      FieldName := IniFile.ReadString (
        'Field' + IntToStr (I), 'Name', '');
      if FieldName = '' then
        raise EMdDataSetError.Create (
          'InitFieldsDefs: No name for field ' +
          IntToStr (I));
      nSize := IniFile.ReadInteger (
         'Field' + IntToStr (I), 'Size', 0);
      FieldDefs.Add (FieldName,
        FieldType, nSize, False);
      // save offset and compute size
      FFieldOffset.Add (Pointer (TmpFieldOffset));
      case FieldType of
        ftString:
          Inc (TmpFieldOffset, nSize + 1);
        ftBoolean, ftSmallInt, ftWord:
          Inc (TmpFieldOffset, 2);
        ftInteger, ftDate, ftTime:
          Inc (TmpFieldOffset, 4);
        ftFloat, ftCurrency, ftDateTime:
          Inc (TmpFieldOffset, 8);
      else
        raise EMdDataSetError.Create (
          'InitFieldsDefs: Unsupported field type');
      end;
    end; // for
  finally
    IniFile.Free;
  end;
  FRecordSize := TmpFieldOffset;
end;

// I: close the table/file
procedure TMdDataSetStream.InternalClose;
begin
  // if required, save updated header
  if (FDataFileHeader.RecordCount <> FRecordCount) or
    (FDataFileHeader.RecordSize = 0) then
  begin
    FDataFileHeader.RecordSize := FRecordSize;
    FDataFileHeader.RecordCount := FRecordCount;
    if Assigned (FStream) then
    begin
      FStream.Seek (0, soFromBeginning);
      FStream.WriteBuffer (
        FDataFileHeader, FDataFileHeaderSize);
    end;
  end;
  // free the internal list field offsets and the stream
  FFieldOffset.Free;
  FStream.Free;
  inherited InternalClose;
end;

// I: Create a new table/file
procedure TMdDataSetStream.CreateTable;
begin
  CheckInactive;
  InternalInitFieldDefs;

  // create the new file
  if FileExists (FTableName) then
    raise EMdDataSetError.Create ('File ' + FTableName + ' already exists');
  FStream := TFileStream.Create (FTableName,
    fmCreate or fmShareExclusive);
  try
    // save the header
    FDataFileHeader.VersionNumber := HeaderVersion;
    FDataFileHeader.RecordSize := 0; // used later
    FDataFileHeader.RecordCount := 0; // empty
    FStream.WriteBuffer (
      FDataFileHeader, FDataFileHeaderSize);
  finally
    // close the file
    FStream.Free;
  end;
end;

//////////////////////////////////////////
////// Part III:
////// Record buffers management
//////////////////////////////////////////

// III: loading of the actual data for the GetCurrent request
procedure TMdDataSetStream.InternalLoadCurrentRecord (Buffer: TRecordBuffer);
begin
  FStream.Position := FDataFileHeaderSize +
    FRecordSize * FCurrentRecord;
  FStream.ReadBuffer (Buffer^, FRecordSize);
  with PMdRecInfo(Buffer + FRecordSize)^ do
  begin
    BookmarkFlag := bfCurrent;
    Bookmark := FCurrentRecord;
  end;
end;

// III: Write the current data to the file
procedure TMdDataSetStream.InternalPost;
begin
  CheckActive;
  if State = dsEdit then
  begin
    // replace data with new data
    FStream.Position := FDataFileHeaderSize +
      FRecordSize * FCurrentRecord;
    FStream.WriteBuffer (ActiveBuffer^, FRecordSize);
  end
  else
  begin
    // always append
    InternalLast;
    FStream.Seek (0, soFromEnd);
    FStream.WriteBuffer (ActiveBuffer^, FRecordSize);
    Inc (FRecordCount);
  end;
end;

// III: Add the current data to the file
procedure TMdDataSetStream.InternalAddRecord(
  Buffer: Pointer; Append: Boolean);
begin
  // always append at the end
  InternalLast;
  FStream.Seek (0, soFromEnd);
  FStream.WriteBuffer (ActiveBuffer^, FRecordSize);
  Inc (FRecordCount);
end;

//////////////////////////////////////////
////// Part IV:
////// From buffers to fields
//////////////////////////////////////////

// IV: Move data from record buffer to field
function TMdDataSetStream.GetFieldData (
  Field: TField; Buffer: Pointer): Boolean;
var
  FieldOffset: Integer;
  Ptr: TRecordBuffer; // was PChar;
begin
  Result := False;
  if not IsEmpty and (Field.FieldNo > 0) then
  begin
    FieldOffset := Integer (
      FFieldOffset [Field.FieldNo - 1]);
    Ptr := ActiveBuffer;
    Inc (Ptr, FieldOffset);
    if Assigned (Buffer) then
      Move (Ptr^, Buffer^, Field.DataSize);
    Result := True;
    if (Field is TDateTimeField) and (Integer(Ptr^) = 0) then
      Result := False;
  end;
end;

// IV: Move data from field to record buffer
procedure TMdDataSetStream.SetFieldData(Field: TField; Buffer: Pointer);
var
  FieldOffset: Integer;
  Ptr: TRecordBuffer; // was PChar;
begin
  if Field.FieldNo >= 0 then
  begin
    FieldOffset := Integer (
      FFieldOffset [Field.FieldNo - 1]);
    Ptr := ActiveBuffer;
    Inc (Ptr, FieldOffset);
    if Assigned (Buffer) then
      Move (Buffer^, Ptr^, Field.DataSize)
    else
      raise Exception.Create (
        'Very bad error in TMdDataSetStream.SetField data');
    DataEvent (deFieldChange, Longint(Field));
  end;
end;

procedure Register;
begin
  RegisterComponents('Md', [TMdDataSetStream]);
end;

function TMdDataSetStream.InternalRecordCount: Integer;
begin
  Result := FRecordCount;
end;

procedure TMdDataSetStream.SetTableName(const Value: string);
begin
  if IsCursorOpen then
    if csDesigning in ComponentState then
      Close
    else
      raise Exception.Create ('Cannot assing an open dataset to a new file');
  FTableName := Value;
end;

end.
