program PatternDemo;

uses
  Forms,
  SingleInstance in 'SingleInstance.pas',
  PatternMainForm in 'PatternMainForm.pas' {Form1},
  PatternSecondaryForm in 'PatternSecondaryForm.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
