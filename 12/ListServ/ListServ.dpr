program ListServ;

uses
  Forms,
  ListForm in 'ListForm.pas' {ListServForm},
  ListServ_TLB in 'ListServ_TLB.pas',
  ListObj in 'ListObj.pas' {ListServer: CoClass};

{$R *.TLB}

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TListServForm, ListServForm);
  Application.Run;
end.
