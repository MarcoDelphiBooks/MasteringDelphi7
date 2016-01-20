program IeFirst;

{$APPTYPE CONSOLE}

uses
  WebBroker,
  CGIApp,
  IeFirstDm in 'IeFirstDm.pas' {WebModule1: TWebModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TWebModule1, WebModule1);
  Application.Run;
end.
