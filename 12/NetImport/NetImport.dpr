program NetImport;

uses
  Forms,
  NetImportForm in 'NetImportForm.pas' {Form1},
  NetLibrary_TLB in 'NetLibrary_TLB.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
