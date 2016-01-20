program DataService;

{$APPTYPE CONSOLE}

uses
  WebBroker,
  CGIApp,
  DataWm in 'DataWm.pas' {WebModule1: TWebModule},
  DataService_TLB in 'DataService_TLB.pas',
  DataRdm in 'DataRdm.pas' {DataServiceObj: TRemoteDataModule} {DataServiceObj: CoClass};

{$R *.TLB}

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TWebModule1, WebModule1);
  Application.Run;
end.
