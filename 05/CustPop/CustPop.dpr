program CustPop;

uses
  Forms,
  PopForm in 'PopForm.pas' {FormPopup}; {FormColorText}

{$R *.RES}

begin
  Application.CreateForm(TFormPopup, FormPopup);
  Application.Run;
end.

