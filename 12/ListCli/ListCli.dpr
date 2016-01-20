program ListCli;

uses
  Forms,
  LCliForm in 'LCliForm.pas' {ListCliForm},
  ListServ_TLB in 'ListServ_TLB.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TListCliForm, ListCliForm);
  Application.Run;
end.
