program QSplash2;

uses
  QForms,
  MainSpF in 'MainSpF.pas' {Form1},
  AboutF in 'AboutF.pas' {AboutBox};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
