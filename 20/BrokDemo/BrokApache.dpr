library BrokApache;

uses
  WebBroker,
  ApacheApp,
  BrokWm in 'BrokWm.pas' {WebModule1: TWebModule};

{$R *.res}

exports
  apache_module name 'brokdemo_module';

begin
  ContentType:= 'brokdemo-handler';

  Application.Initialize;
  Application.CreateForm(TWebModule1, WebModule1);
  Application.Run;
end.
