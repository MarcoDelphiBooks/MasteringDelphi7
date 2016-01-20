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
    MemoRequest: TMemo;
    MemoResponse: TMemo;
    procedure btnTranslateClick(Sender: TObject);
    procedure btnDirectClick(Sender: TObject);
    procedure HTTPRIO1AfterExecute(const MethodName: String;
      SOAPResponse: TStream);
    procedure HTTPRIO1BeforeExecute(const MethodName: String;
      var SOAPRequest: WideString);
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

procedure TForm1.HTTPRIO1AfterExecute(const MethodName: String;
  SOAPResponse: TStream);
begin
  SOAPResponse.Position := 0;
  MemoResponse.Lines.LoadFromStream(SOAPResponse);
end;

procedure TForm1.HTTPRIO1BeforeExecute(const MethodName: String;
  var SOAPRequest: WideString);
begin
  MemoRequest.Text := SoapRequest;
end;

end.
