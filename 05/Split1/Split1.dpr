program Split1;

uses
  Forms,
  SplitFrm in 'SplitFrm.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
