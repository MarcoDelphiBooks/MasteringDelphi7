program WSnapUsers;

{$APPTYPE GUI}

uses
  Forms,
  ComApp,
  MainForm in 'MainForm.pas' {Form1},
  Home_dm in 'Home_dm.pas' {Home: TWebAppPageModule} {*.html},
  Login_dm in 'Login_dm.pas' {loginform: TWebPageModule} {*.html};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
