program SoapDataServer7;

{$APPTYPE GUI}

uses
  Forms,
  SockApp,
  SoapDataServerForm in 'SoapDataServerForm.pas' {Form1},
  SoapDataServerWebModule in 'SoapDataServerWebModule.pas' {WebModule2: TWebModule},
  SoapDataServerDataModule in 'SoapDataServerDataModule.pas' {sampledatamodule: TSoapDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TWebModule2, WebModule2);
  Application.Run;
end.
