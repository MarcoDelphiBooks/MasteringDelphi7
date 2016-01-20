program Scroll1;

uses
  Forms,
  ScrollF in 'ScrollF.pas' {Form1},
  StatusF in 'StatusF.pas' {Status};

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TStatus, Status);
  Application.Run;
end.
