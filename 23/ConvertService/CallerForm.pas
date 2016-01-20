unit CallerForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ConvertIntf, SoapHTTPClient, InvokeRegistry;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    EditAmount: TEdit;
    ComboBoxFrom: TComboBox;
    ComboBoxTo: TComboBox;
    LabelResult: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    Invoker: THTTPRio;
    ConvIntf: IConvert;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  LabelResult.Caption := Format ('%n', [(ConvIntf.ConvertCurrency(
    ComboBoxFrom.Text, ComboBoxTo.Text, StrToFloat (EditAmount.Text)))]);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Invoker := THTTPRio.Create(nil);
  Invoker.URL := 'http://localhost/scripts/ConvertService.exe/soap/iconvert';
  ConvIntf := Invoker as IConvert;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  TypeNames: string;
begin
  TypeNames := ConvIntf.TypesList;
  ComboBoxFrom.Items.Text := StringReplace (TypeNames, ';', sLineBreak, [rfReplaceAll]);
  ComboBoxTo.Items := ComboBoxFrom.Items;
end;

end.
