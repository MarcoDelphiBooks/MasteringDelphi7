unit ObjdsDemoForm;

interface

uses
  MdDsList, MdDsCustom, TypInfo, DB, Classes, SysUtils;

type
  TMdObjDataSet = class(TMdListDataSet)
  private
    PropList: PPropList;
    nProps: Integer;
    FObjClass: TPersistentClass;
    ObjClone: TPersistent;
    FChangeToClone: Boolean;
    procedure SetObjClass(const Value: TPersistentClass);
    function GetObjects(I: Integer): TPersistent;
    procedure SetChangeToClone(const Value: Boolean);
  protected
    procedure InternalInitFieldDefs; override;
    procedure InternalClose; override;
    procedure InternalInsert; override;
    procedure InternalPost; override;
    procedure InternalCancel; override;
    procedure InternalEdit; override;
    procedure SetFieldData(Field: TField; Buffer: Pointer); override;
    function GetCanModify: Boolean; override;
    procedure InternalPreOpen; override;
  public
    function GetFieldData(Field: TField; Buffer: Pointer): Boolean; override;
    property Objects [I: Integer]: TPersistent read GetObjects;
    function Add: TPersistent;
  published
    property ObjClass: TPersistentClass read FObjClass write SetObjClass;
    property ChangesToClone: Boolean read FChangeToClone write SetChangeToClone default False;
  end;

procedure DoClone (SourceObj: TPersistent; TargetObj: TPersistent); forward;

procedure Register;

implementation

uses
  Dialogs, Windows, Forms, Controls;

procedure Register;
begin
  RegisterComponents ('Md', [TMdObjDataSet]);
end;

// generic object cloning (RTTI-based)
procedure DoClone (SourceObj: TPersistent; TargetObj: TPersistent);
var
  nProps, i: Integer;
  PropList: PPropList;
  Value: Variant;
begin
  // get list of properties
  nProps := GetTypeData(SourceObj.ClassInfo)^.PropCount;
  GetMem(PropList, nProps * SizeOf(Pointer));
  GetPropInfos (SourceObj.ClassInfo, PropList);

  // shortcut: use varaints... (must fix this)
  for i := 0 to nProps - 1 do
  begin
    Value := GetPropValue (SourceObj, PropList [i].Name);
    SetPropValue (TargetObj, PropList [i].Name, Value);
  end;
  FreeMem (PropList);
end;

////////////////////////
// File Handling Support

procedure TMdObjDataSet.InternalInitFieldDefs;
var
  i: Integer;
begin
  if FObjClass = nil then
    raise Exception.Create ('TMdObjDataSet: Unassigned class');

  // field definitions
  FieldDefs.Clear;
  nProps := GetTypeData(fObjClass.ClassInfo)^.PropCount;
  GetMem(PropList, nProps * SizeOf(Pointer));
  GetPropInfos (fObjClass.ClassInfo, PropList);

  for i := 0 to nProps - 1 do
    case PropList [i].PropType^.Kind of
      tkInteger, tkEnumeration, tkSet:
        FieldDefs.Add (PropList [i].Name, ftInteger, 0);
      tkChar: FieldDefs.Add (PropList [i].Name, ftFixedChar, 0);
      tkFloat: FieldDefs.Add (PropList [i].Name, ftFloat, 0);
      tkString, tkLString:
        FieldDefs.Add (PropList [i].Name, ftString, 50); // TODO: fix size
      // tkClass, tkMethod, tkWChar
      tkWString: FieldDefs.Add (PropList [i].Name, ftWideString, 50); // TODO: fix size
      // tkVariant, tkArray, tkRecord, tkInterface, tkInt64, tkDynArray
    end;
end;

procedure TMdObjDataSet.InternalPost;
begin
  if FChangeToClone and Assigned (ObjClone) then
    DoClone (ObjClone, TPersistent (fList [fCurrentRecord]));
end;

procedure TMdObjDataSet.InternalCancel;
begin
  if not FChangeToClone and Assigned (ObjClone) then
    DoClone (ObjClone, TPersistent(fList [fCurrentRecord]));
end;

function TMdObjDataSet.GetFieldData (
  Field: TField; Buffer: Pointer): Boolean;
var
  Obj: TPersistent;
  TypeInfo: PTypeInfo;
  IntValue: Integer;
  FlValue: Double;
begin
  if FList.Count = 0 then
  begin
    Result := False;
    exit;
  end;

  if FChangeToClone and Assigned (ObjClone) and
      (State = dsEdit) and
      (PInteger(ActiveBuffer)^ = fCurrentRecord) then
    Obj:= ObjClone
  else
    Obj := fList [PInteger(ActiveBuffer)^] as TPersistent;

  TypeInfo := PropList [Field.FieldNo-1]^.PropType^;
  case TypeInfo.Kind of
    tkInteger, tkChar, tkWChar, tkClass, tkEnumeration, tkSet:
      begin
        IntValue := GetOrdProp(Obj, PropList [Field.FieldNo-1]);
        Move (IntValue, Buffer^, sizeof (Integer));
      end;
    tkFloat:
      begin
        FlValue := GetFloatProp(Obj, PropList [Field.FieldNo-1]);
        Move (FlValue, Buffer^, sizeof (Double));
      end;
    tkString, tkLString, tkWString:
      StrCopy (Buffer, pchar(GetStrProp(Obj, PropList [Field.FieldNo-1])));
  end;
  Result := True;
end;

// III: Move data from field to record buffer
procedure TMdObjDataSet.SetFieldData(Field: TField; Buffer: Pointer);
var
  Obj: TPersistent;
  TypeInfo: PTypeInfo;
  IntValue: Integer;
  FlValue: Double;
begin
  if FList.Count = 0 then
    Exit;

  if FChangeToClone and Assigned (ObjClone) then
    Obj:= ObjClone
  else
    Obj := fList [PInteger(ActiveBuffer)^] as TPersistent;
  TypeInfo := PropList [Field.FieldNo-1]^.PropType^;
  case TypeInfo.Kind of
    tkInteger, tkChar, tkWChar, tkClass, tkEnumeration, tkSet:
      begin
        Move (Buffer^, IntValue, sizeof (Integer));
        SetOrdProp(Obj, PropList [Field.FieldNo-1], IntValue);
      end;
    tkFloat:
      begin
        Move (Buffer^, FlValue, sizeof (Double));
        SetFloatProp(Obj, PropList [Field.FieldNo-1], FlValue);
      end;
    tkString, tkLString, tkWString:
      SetStrProp(Obj, PropList [Field.FieldNo-1], pchar(Buffer));
  end;
  SetModified (True);
end;

procedure TMdObjDataSet.InternalInsert;
begin
  // insert at the end only (Why reverse? Clears the buffers!)
  Add;
  Last;
  // TODO: add clone object support
end;

procedure TMdObjDataSet.InternalEdit;
begin
  DoClone (fList [FCurrentRecord] as TPersistent, ObjClone);
end;

function TMdObjDataSet.GetCanModify: Boolean;
begin
  Result := True; // read-write
end;

procedure TMdObjDataSet.SetObjClass(const Value: TPersistentClass);
begin
  FObjClass := Value;
end;

function TMdObjDataSet.GetObjects(i: Integer): TPersistent;
begin
  if i < fList.Count then
    Result := fList [i] as TPersistent
  else
    Result := nil;
    // or raise exception
end;

function TMdObjDataSet.Add: TPersistent;
begin
  if not Active then
    Open;
  Result := fObjClass.Create;
  fList.Add (Result);
end;

procedure TMdObjDataSet.InternalPreOpen;
begin
  inherited;
  ObjClone := FObjClass.Create;
end;

procedure TMdObjDataSet.InternalClose;
begin
  inherited;
  ObjClone.Free;
  ObjClone := nil;
end;

procedure TMdObjDataSet.SetChangeToClone(const Value: Boolean);
begin
  if not Active then
    FChangeToClone := Value
  else
    raise Exception.Create ('Cannot change style for an open dataset');
end;

end.


