program JetImportExport;

uses
  Forms,
  JetImportExportU1 in 'JetImportExportU1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
