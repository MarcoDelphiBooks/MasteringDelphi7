unit MdPropEdit;

interface

uses
  DsgnIntf;

type
  TMdIntListProperty = class (TStringProperty)
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure Edit; override;
  end;

procedure Register;

implementation

uses
  SysUtils, MdIlpeForm, MdTabList, Forms, Controls;

function TMdIntListProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog, paReadOnly];
end;

procedure TMdIntListProperty.Edit;
var
  PEForm: TIntListPEForm;
  Tabs: TMdTabbedList;
  I: Integer;
begin
  PEForm := TIntListPEForm.Create (Application);
  try
    Tabs := GetComponent (0) as TMdTabbedList;
    for I := Low (TMdTabsArray) to High (TMdTabsArray) do
      PEForm.Memo1.Lines.Add (IntToStr (Tabs.TabStops [I]));
    if PEForm.ShowModal = mrOK then
    begin
      for I := Low (TMdTabsArray) to High (TMdTabsArray) do
        Tabs.TabStops [I] := StrToIntDef (PEForm.Memo1.Lines [I], 0);
      Designer.Modified;
    end;
  finally
    PEForm.Free;
  end;
end;

procedure Register;
begin
  RegisterPropertyEditor (TypeInfo (string),
    TMdTabbedList, 'TabsString', TMdIntListProperty);
end;

end.

