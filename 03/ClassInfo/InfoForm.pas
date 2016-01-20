unit InfoForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, ExtCtrls, Buttons, Grids, Menus;

type
  TForm1 = class(TForm)
    ListParent: TListBox;
    Label1: TLabel;
    EditInfo: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Panel1: TPanel;
    ListClasses: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure ListClassesClick(Sender: TObject);
  private
    ClassArray: array of TClass;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  SetLength (ClassArray, 50);

  ClassArray [0] := TButton;
  ClassArray [1] := TBitBtn;   
  ClassArray [2] := TEdit;
  ClassArray [3] := TPopupMenu;
  ClassArray [4] := TRadioButton;
  ClassArray [5] := TRadioGroup;
  ClassArray [6] := TPanel;
  ClassArray [7] := TCheckBox;
  ClassArray [8] := TForm;
  ClassArray [9] := TComboBox;
  ClassArray [10] := TGroupBox;
  ClassArray [11] := TSpeedButton;
  ClassArray [12] := TLabel;
  ClassArray [13] := TListBox;
  ClassArray [14] := TMainMenu;
  ClassArray [15] := TMemo;

  // copy class names to the listbox
  for I := 0 to 15 do
    ListClasses.Items.Add (ClassArray [I].ClassName);
  // select the first class
  ListClasses.ItemIndex := 0;
  // show initial information
  ListClassesClick (Sender);
end;

procedure TForm1.ListClassesClick(Sender: TObject);
var
  MyClass: TClass;
begin
  MyClass := ClassArray [ListClasses.ItemIndex];
  EditInfo.Text := Format ('Name: %s - Size: %d bytes',
    [MyClass.ClassName, MyClass.InstanceSize]);
  with ListParent.Items do
  begin
    Clear;
    while MyClass.ClassParent <> nil do
    begin
      MyClass := MyClass.ClassParent;
      Add (MyClass.ClassName);
    end;
  end;
end;

end.
