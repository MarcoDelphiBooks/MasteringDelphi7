program WebSearchDebug;

{$APPTYPE GUI}

uses
  Forms,
  ComApp,
  WebReq,
  DebugForm in 'DebugForm.pas' {Form1},
  WebSearch in 'WebSearch.pas' {WebModule1: TWebModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TWebModule1, WebModule1);
  WebRequestHandler.WebModuleClass := TWebModule1;

  Application.Run;
end.
