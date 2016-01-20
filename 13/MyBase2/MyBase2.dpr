program MyBase2;

uses
  Forms,
  MyBase2Form in 'MyBase2Form.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
