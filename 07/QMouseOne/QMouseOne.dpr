program QMouseOne;

uses
  QForms,
  MouseF in 'MouseF.pas' {MouseForm};

{$R *.res}

begin
  Application.CreateForm(TMouseForm, MouseForm);
  Application.Run;
end.

