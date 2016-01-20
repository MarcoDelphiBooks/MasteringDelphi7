program QCustPop;

uses
  QForms,
  PopForm in 'PopForm.pas' {FormPopup}; {FormColorText}

{$R *.res}

begin
  Application.CreateForm(TFormPopup, FormPopup);
  Application.Run;
end.

