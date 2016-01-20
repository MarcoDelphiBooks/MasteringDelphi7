program Splash0;

uses
  Forms,
  MainSpF in 'MainSpF.pas' {Form1},
  AboutF in 'AboutF.pas' {AboutBox};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
