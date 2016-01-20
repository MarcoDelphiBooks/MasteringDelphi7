program SoapEmployeeServer;

{$APPTYPE GUI}

uses
  Forms,
  SockApp,
  ServerSoapDataModule in 'ServerSoapDataModule.pas' {WebModule2: TWebModule},
  SoapEmployeeImpl in 'SoapEmployeeImpl.pas',
  ServerForm in 'ServerForm.pas' {Form1},
  ServerDataModule in 'ServerDataModule.pas' {DataModule3: TDataModule},
  SoapEmployeeIntf in 'SoapEmployeeIntf.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TWebModule2, WebModule2);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
