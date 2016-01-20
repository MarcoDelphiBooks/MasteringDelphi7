program DateEvt;

uses
  Forms,
  DateF in 'DateF.pas' {DateForm},
  Dates in 'Dates.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TDateForm, DateForm);
  Application.Run;
end.

