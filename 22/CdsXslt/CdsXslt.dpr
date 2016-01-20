program CdsXslt;

{$APPTYPE CONSOLE}

uses
  WebBroker,
  CGIApp,
  CdsXsltDm in 'CdsXsltDm.pas' {WebModule1: TWebModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TWebModule1, WebModule1);
  Application.Run;
end.
