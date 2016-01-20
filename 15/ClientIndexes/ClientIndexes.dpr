program ClientIndexes;

uses
  Forms,
  ClientIndexesU1 in 'ClientIndexesU1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
