program WebSearcher;

{$APPTYPE CONSOLE}

uses
  WebBroker,
  CGIApp,
  WebSearch in 'WebSearch.pas' {WebModule1: TWebModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TWebModule1, WebModule1);
  Application.Run;
end.
