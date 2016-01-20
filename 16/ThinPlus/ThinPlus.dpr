program ThinPlus;

uses
  Forms,
  ThinForm in 'ThinForm.pas' {ClientForm},
  QueForm in 'QueForm.pas' {FormQuery};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TClientForm, ClientForm);
  Application.CreateForm(TFormQuery, FormQuery);
  Application.Run;
end.
