program Splash1;

uses
  Forms,
  MainSpF in 'MainSpF.pas' {Form1},
  AboutF in 'AboutF.pas' {AboutBox};

{$R *.RES}

var
  SplashAbout: TAboutBox;

begin
  Application.Initialize;
  // create and show the splash form
  SplashAbout := TAboutBox.Create (Application);
  try
    SplashAbout.MakeSplash;
    // standard code...
    Application.CreateForm(TForm1, Form1);
  SplashAbout.Close;
  finally
    SplashAbout.Free;
  end;
  Application.Run;
end.
