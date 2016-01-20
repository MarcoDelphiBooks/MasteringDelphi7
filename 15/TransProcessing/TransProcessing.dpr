program TransProcessing;

uses
  Forms,
  TransProcessingU1 in 'TransProcessingU1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
