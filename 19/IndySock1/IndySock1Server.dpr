program IndySock1Server;

uses
  Forms,
  IndySock1ServerForm in 'IndySock1ServerForm.pas' {FormServer};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormServer, FormServer);
  Application.Run;
end.
