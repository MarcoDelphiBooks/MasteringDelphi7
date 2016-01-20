program SoapFishServer;

{$APPTYPE GUI}

uses
  Forms,
  SockApp,
  SoapFishForm in 'SoapFishForm.pas' {Form1},
  SoapFishModule in 'SoapFishModule.pas' {WebModule2: TWebModule},
  SoapFishImpl in 'SoapFishImpl.pas',
  SoapFishIntf in 'SoapFishIntf.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TWebModule2, WebModule2);
  Application.Run;
end.
