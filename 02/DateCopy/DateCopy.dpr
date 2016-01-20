program DateCopy;

uses
  Forms,
  DateF in 'DateF.pas' {DateForm},
  Dates in 'Dates.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDateForm, DateForm);
  Application.Run;
end.

