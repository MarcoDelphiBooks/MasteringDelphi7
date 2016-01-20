program CustQueP;

{$APPTYPE CONSOLE}

uses
  WebBroker,
  CGIApp,
  CustWebM in 'CustWebM.pas' {WebModule1: TWebModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TWebModule1, WebModule1);
  Application.Run;
end.
