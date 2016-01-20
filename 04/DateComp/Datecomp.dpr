program DateComp;

uses
  Forms,
  DateF in 'DateF.pas' {DateForm};

{$R *.RES}

begin
  Application.CreateForm(TDateForm, DateForm);
  Application.Run;
end.

