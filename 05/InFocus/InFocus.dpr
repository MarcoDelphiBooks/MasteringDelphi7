program InFocus;

uses
  Forms,
  FocusF in 'FocusF.pas' {FocusForm};

{$R *.RES}

begin
  Application.CreateForm(TFocusForm, FocusForm);
  Application.Run;
end.

