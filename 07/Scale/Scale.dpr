program Scale;

uses
  Forms,
  ScaleF in 'ScaleF.pas' {Form1};

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
