program IfSender;

uses
  Forms,
  SendForm in 'SendForm.pas' {SenderForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TSenderForm, SenderForm);
  Application.Run;
end.
