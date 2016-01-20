unit UseIntfForm;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, TypInfo;

type
  TFormUseIntf = class(TForm)
    BtnChange: TButton;
    lbClasses: TListBox;
    cbModal: TCheckBox;
    Label1: TLabel;
    procedure BtnChangeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  public
    HandlesPackages: TList;
    procedure LoadDynaPackage (PackageName: string);
  end;

var
  FormUseIntf: TFormUseIntf;

implementation

{$R *.DFM}

uses
  IntfColSel;

procedure TFormUseIntf.BtnChangeClick(Sender: TObject);
var
  AComponent: TComponent;
  ColorSelect: IColorSelect;
begin
  AComponent := TComponentClass (ClassesColorSelect
    [LbClasses.ItemIndex]).Create (Application);
  // if the interface is available
  if not Supports (AComponent, IColorSelect) then
    ShowMessage ('Interface not supported')
  else
  begin
    // access to the interface
    ColorSelect := AComponent as IColorSelect;
    // initialize the data
    ColorSelect.SelColor := Color;
    if cbModal.Checked then
    begin
      if ColorSelect.Display (True) then
        Color := ColorSelect.SelColor;
      AComponent.Free;
      ColorSelect := nil;
    end
    else
      // modeless execution
      ColorSelect.Display(False);
  end;
end;

procedure TFormUseIntf.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  // loads all runtime packages
  HandlesPackages := TList.Create;
  LoadDynaPackage ('IntfFormPack.bpl');
  LoadDynaPackage ('IntfFormPack2.bpl');

  // add class names and select the first
  for I := 0 to ClassesColorSelect.Count - 1 do
    lbClasses.Items.Add (ClassesColorSelect [I].ClassName);
  lbClasses.ItemIndex := 0;
end;

procedure TFormUseIntf.LoadDynaPackage(PackageName: string);
var
  Handle: HModule;
begin
  // try to load the package
  Handle := LoadPackage (PackageName);
  if Handle > 0 then
    // add to the list for later removal
    HandlesPackages.Add (Pointer(Handle))
  else
    ShowMessage ('Package ' + PackageName + ' not found');
end;

procedure TFormUseIntf.FormDestroy(Sender: TObject);
var
  I: Integer;
begin
  // unlaod all packages
  for I := 0 to HandlesPackages.Count - 1 do
    UnloadPackage (Cardinal (HandlesPackages [I]));
  // free the lists
  HandlesPackages.Free;
end;

end.
