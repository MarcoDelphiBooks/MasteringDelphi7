program QOdlist;

uses
  QForms,
  ODListF in 'ODListF.pas' {ODListForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TODListForm, ODListForm);
  Application.Run;
end.
