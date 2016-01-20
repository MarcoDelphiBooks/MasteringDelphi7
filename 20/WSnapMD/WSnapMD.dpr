program WSnapMD;

{$APPTYPE GUI}

uses
  Forms,
  mainform in 'mainform.pas' {Form1},
  home_dm in 'home_dm.pas' {HomePage: TWebAppPageModule} {*.html},
  datamod in 'datamod.pas' {WDataMod: TWebDataModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
