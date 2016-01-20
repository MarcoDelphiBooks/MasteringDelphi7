program UseIntfPack;

uses
  Forms,
  UseIntfForm in 'UseIntfForm.pas' {FormUseIntf};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFormUseIntf, FormUseIntf);
  Application.Run;
end.
