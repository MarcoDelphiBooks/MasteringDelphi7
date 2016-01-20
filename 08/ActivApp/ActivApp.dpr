program ActivApp;

uses
  Forms,
  MainF in 'MainF.pas' {Form1},
  SecondF in 'SecondF.pas' {Form2};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
