program CgiIntra;

{$APPTYPE CONSOLE}

uses
  WebBroker,
  CGIApp,
  CgiIntraWm in 'CgiIntraWm.pas' {WebModule1: TWebModule},
  CgiIntraForm in 'CgiIntraForm.pas' {formMain: TIWPageForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TWebModule1, WebModule1);
  Application.Run;
end.
