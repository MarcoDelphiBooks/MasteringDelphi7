program DbError;

uses
  Forms,
  DBErrFo in 'DBErrFo.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
