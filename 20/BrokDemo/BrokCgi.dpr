program BrokCgi;

{$APPTYPE CONSOLE}

uses
  WebBroker,
  CGIApp,
  BrokWm in 'BrokWm.pas' {WebModule1: TWebModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TWebModule1, WebModule1);
  Application.Run;
end.
