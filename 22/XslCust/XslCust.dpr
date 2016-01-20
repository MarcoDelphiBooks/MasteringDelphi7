program XslCust;

{$APPTYPE CONSOLE}

uses
  WebBroker,
  CGIApp,
  XslCustDm in 'XslCustDm.pas' {customers: TWebAppPageModule} {*.xsl};

{$R *.RES}

begin
  Application.Initialize;
  Application.Run;
end.
