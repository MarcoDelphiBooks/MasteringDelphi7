program JetExcel;

uses
  Forms,
  ExcelU1 in 'ExcelU1.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
