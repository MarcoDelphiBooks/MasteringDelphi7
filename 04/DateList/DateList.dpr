program Datelist;

uses
  Forms,
  DateForm in 'DateForm.pas' {Form1},
  Dates in 'Dates.pas',
  DateL in 'DateL.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
