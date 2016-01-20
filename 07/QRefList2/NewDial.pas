unit NewDial;

interface

uses
  Qt, SysUtils, Classes, QGraphics, QControls, QForms, QDialogs,
  QStdCtrls, QButtons;

type
  TFormItem = class(TForm)
    EditReference: TEdit;
    EditAuthor: TEdit;
    EditCountry: TEdit;
    ComboType: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
  private
    { Private declarations }
  public
    procedure Clear;
  end;

var
  FormItem: TFormItem;

implementation

{$R *.xfm}

{ TFormItem }

procedure TFormItem.Clear;
var
  I: Integer;
begin
  // clear each edit box
  for I := 0 to ControlCount - 1 do
    if Controls [I] is TEdit then
      TEdit (Controls[I]).Text := '';
end;

end.
  
