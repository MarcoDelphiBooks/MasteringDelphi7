program WSnapSession;

{$APPTYPE GUI}

uses
  Forms,
  ComApp,
  mainform in 'mainform.pas' {Form1},
  homepage_dm in 'homepage_dm.pas' {SessionDemo: TWebAppPageModule} {*.html};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
