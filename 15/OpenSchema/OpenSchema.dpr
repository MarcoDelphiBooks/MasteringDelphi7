program OpenSchema;

uses
  Forms,
  OpenSchemaU1 in 'OpenSchemaU1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
