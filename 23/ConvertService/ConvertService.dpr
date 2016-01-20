program ConvertService;

{$APPTYPE CONSOLE}

uses
  WebBroker,
  CGIApp,
  ConvertWebMod in 'ConvertWebMod.pas' {WebModule1: TWebModule},
  ConvertIntf in 'ConvertIntf.pas',
  ConvertImpl in 'ConvertImpl.pas',
  EuroConvConst in 'EuroConvConst.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TWebModule1, WebModule1);
  Application.Run;
end.
