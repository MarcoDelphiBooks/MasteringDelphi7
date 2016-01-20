program FirstADOExample;

uses
  Forms,
  FirstADOExampleU1 in 'FirstADOExampleU1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
