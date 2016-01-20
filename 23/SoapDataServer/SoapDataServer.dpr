program SoapDataServer;

{$APPTYPE GUI}

uses
  Forms,
  ComApp,
  ServerForm in 'ServerForm.pas' {Form1},
  ServerWebModule in 'ServerWebModule.pas' {WebModule2: TWebModule},
  ServerDataModule in 'ServerDataModule.pas' {SoapTestDm: TSoapDataModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TWebModule2, WebModule2);
  Application.Run;
end.
