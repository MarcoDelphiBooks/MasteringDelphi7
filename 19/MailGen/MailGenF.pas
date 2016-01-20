unit MailGenF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtActns, ActnList;

type
  TForm1 = class(TForm)
    BtnSend: TButton;
    EditAddress: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    EditSubject: TEdit;
    Memo1: TMemo;
    procedure BtnSendClick(Sender: TObject);
    procedure EditAddressChange(Sender: TObject);
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
  ShellApi;

procedure TForm1.BtnSendClick(Sender: TObject);
var
  strMsg: string;
  I: Integer;
begin
  // set the basic information
  strMsg := 'mailto:' + EditAddress.Text +
    '?Subject=' + EditSubject.Text +
    '&Body=';
  // add first line
  if Memo1.Lines.Count > 1 then
    strMsg := strMsg + Memo1.Lines [0];
  // add subsequent lines separated by the newline symbol
  for I := 1 to Memo1.Lines.Count - 1 do
    strMsg := strMsg + '%0D%0A' + Memo1.Lines [I];
  // send the message
  ShellExecute (Handle, 'open', PChar (strMsg),
    '', '', SW_SHOW);
end;

procedure TForm1.EditAddressChange(Sender: TObject);
begin
  BtnSend.Enabled := EditAddress.Text <> '';
end;

end.
