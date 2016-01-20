program ODList;

uses
  Forms,
  ODListF in 'ODListF.pas' {ODListForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TODListForm, ODListForm);
  Application.Run;
end.
