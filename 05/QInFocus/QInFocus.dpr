program QInFocus;

uses
  QForms,
  FocusF in 'FocusF.pas' {FocusForm};

{$R *.res}

begin
  Application.CreateForm(TFocusForm, FocusForm);
  Application.Run;
end.

