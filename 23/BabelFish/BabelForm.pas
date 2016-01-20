unit BabelForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Rio, SoapHTTPClient, InvokeRegistry;

type
  TForm1 = class(TForm)
    HTTPRIO1: THTTPRIO;
    btnTranslate: TButton;
    EditSource: TEdit;
    EditTarget: TEdit;
    ComboBoxType: TComboBox;
    btnDirect: TButton;
    HTTPRIO2: THTTPRIO;
    procedure btnTranslateClick(Sender: TObject);
    procedure btnDirectClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  BabelFishService;

procedure TForm1.btnTranslateClick(Sender: TObject);
begin
  // call via the HTTPRIO component
  EditTarget.Text := (HTTPRIO1 as BabelFishPortType).
    BabelFish(ComboBoxType.Text, EditSource.Text);
end;

procedure TForm1.btnDirectClick(Sender: TObject);
begin
  ShowMessage (GetBabelFishPortType.BabelFish(
    'en_it', 'Hello, world!'));
end;

end.
