program usemem;

uses
  Forms,
  UseMemF in 'UseMemF.pas' {Form1};

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
