program CustQueDebug;

{$APPTYPE GUI}

uses
  Forms,
  ComApp,
  CustQueDebugForm in 'CustQueDebugForm.pas' {Form1},
  CustWebM in 'CustWebM.pas' {WebModule1: TWebModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TWebModule1, WebModule1);
  Application.Run;
end.
