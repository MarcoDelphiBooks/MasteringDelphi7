unit RunPropF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Spin;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Button1: TButton;
    ListBox1: TListBox;
    RadioButton1: TRadioButton;
    CheckBox1: TCheckBox;
    ScrollBar1: TScrollBar;
    SpinEdit1: TSpinEdit;
    ComboBox1: TComboBox;
    Bevel1: TBevel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

uses
  TypInfo;

procedure TForm1.Button1Click(Sender: TObject);
var
  I: Integer;
//  PropInfo: PPropInfo;
  Value: Variant;
begin
  ListBox1.Clear;
  for I := 0 to ComponentCount -1 do
  begin
    // Delphi 6 version (slightly different from Delphi 5)
    if IsPublishedProp (Components[I], Edit1.Text) then
    begin
      Value := GetPropValue (Components[I], Edit1.Text);
      ListBox1.Items.Add (Components[I].Name + '.' +
        Edit1.Text + ' = ' + string (Value))
    end
    else
      ListBox1.Items.Add ('No ' + Components[I].Name + '.' +
        Edit1.Text);

    // pre-Delphi 5 version, limited to strings
{
    // get property RTTI
    PropInfo := GetPropInfo (
      Components[I].ClassInfo, Edit1.Text);
    if PropInfo = nil then
      // if not found output a message
      ListBox1.Items.Add (Descr + ' doesn''t exist')
    else if PropInfo.PropType^.Kind <> tkLString then
      // if not a strign output a message
      ListBox1.Items.Add (Descr + ' is not a string')
    else
      // show the value
      ListBox1.Items.Add (Descr + ' = [' +
        GetStrProp (Components[I], PropInfo) + ']');
}
  end;
end;

end.
