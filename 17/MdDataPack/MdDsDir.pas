unit MdDsDir;

interface

uses
  SysUtils, Classes, Db, MdDsList, MdDsCustom;

type
  TMdDirDataset = class(TMdListDataSet)
  private
    FDirectory: string;
    procedure SetDirectory(const NewDirectory: string);
  protected
    // TDataSet virtual methods
    procedure InternalInitFieldDefs; override;
    procedure SetFieldData(Field: TField; Buffer: Pointer); override;
    function GetCanModify: Boolean; override;
    // custom dataset virtual methods
    procedure InternalAfterOpen; override;
  public
    function GetFieldData(Field: TField; Buffer: Pointer): Boolean; override;
  published
    property Directory: string read FDirectory write SetDirectory;
  end;

  TFileData = class
  public
    ShortFileName: string;
    Time: TDateTime;
    Size: Integer;
    Attr: Integer;
    constructor Create (var FileInfo: TSearchRec);
  end;

  procedure Register;

implementation

uses
  TypInfo, Dialogs, Windows, Forms, Controls;

procedure TMdDirDataset.SetDirectory(const NewDirectory: string);
begin
  if FIsTableOpen then
      raise Exception.Create ('Cannot change directory while dataset is open');
  fDirectory := NewDirectory;
end;

procedure TMdDirDataset.InternalAfterOpen;
var
  Attr: Integer;
  FileInfo: TSearchRec;
  FileData: TFileData;
begin
  // scan all files
  Attr := faAnyFile;
  FList.Clear;
  if SysUtils.FindFirst(fDirectory, Attr, FileInfo) = 0 then
  repeat
    FileData := TFileData.Create (FileInfo);
    FList.Add (FileData);
  until SysUtils.FindNext(FileInfo) <> 0;
  SysUtils.FindClose(FileInfo);
end;

procedure TMdDirDataset.InternalInitFieldDefs;
begin
  if fDirectory = '' then
    raise EMdDataSetError.Create ('Missing directory');

  // field definitions
  FieldDefs.Clear;
  FieldDefs.Add ('FileName', ftWideString, 40, True);
  FieldDefs.Add ('TimeStamp', ftDateTime);
  FieldDefs.Add ('Size', ftInteger);
  FieldDefs.Add ('Attributes', ftString, 3);
  FieldDefs.Add ('Folder', ftBoolean);
end;

// support function
function DateTimeToNative(DataType: TFieldType; Data: TDateTime): TDateTimeRec;
var
  TimeStamp: TTimeStamp;
begin
  TimeStamp := DateTimeToTimeStamp(Data);
  case DataType of
    ftDate: Result.Date := TimeStamp.Date;
    ftTime: Result.Time := TimeStamp.Time;
  else
    Result.DateTime := TimeStampToMSecs(TimeStamp);
  end;
end;

function TMdDirDataset.GetFieldData (
  Field: TField; Buffer: Pointer): Boolean;
var
  FileData: TFileData;
  Bool1: WordBool;
  strAttr: string;
  t: TDateTimeRec;
begin
  FileData := fList [Integer(ActiveBuffer^)] as TFileData;
  case Field.Index of
    0: // filename
      StrCopy (Buffer, PChar(FileData.ShortFileName));
    1: // timestamp
    begin
      t := DateTimeToNative (ftdatetime, FileData.Time);
      Move (t, Buffer^, sizeof (TDateTime));
    end;
    2:  // size
      Move (FileData.Size, Buffer^, sizeof (Integer));
    3: begin // attributes
      strAttr := '   ';
      if (FileData.Attr and SysUtils.faReadOnly) > 0 then
        strAttr [1] := 'R';
      if (FileData.Attr and SysUtils.faSysFile) > 0 then
        strAttr [2] := 'S';
      if (FileData.Attr and SysUtils.faHidden) > 0 then
        strAttr [3] := 'H';
      StrCopy (Buffer, pchar(strAttr));
    end;
    4: begin // folder
      Bool1 := FileData.Attr and SysUtils.faDirectory > 0;
      Move (Bool1, Buffer^, sizeof (WordBool));
    end;
  end; // case
  Result := True;
end;

// III: Move data from field to record buffer
procedure TMdDirDataset.SetFieldData(Field: TField; Buffer: Pointer);
begin
  // read only: nothing to todo
end;

function TMdDirDataset.GetCanModify: Boolean;
begin
  Result := False; // read-only
end;

{ TFileData }

constructor TFileData.Create(var FileInfo: TSearchRec);
begin
  ShortFileName := FileInfo.Name;
  Time := FileDateToDateTime (FileInfo.Time);
  Size := FileInfo.Size;
  Attr := FileInfo.Attr;
end;

procedure Register;
begin
  RegisterComponents ('Md', [TMdDirDataset]);
end;

end.

