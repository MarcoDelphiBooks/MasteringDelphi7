program WSnap2;

{$APPTYPE GUI}

uses
  Forms,
  ComApp,
  WSnapForm in 'WSnapForm.pas' {Form1},
  home_dm in 'home_dm.pas' {home: TWebAppPageModule} {*.html},
  country_dm in 'country_dm.pas' {date: TWebPageModule} {*.html},
  date_dm in 'date_dm.pas' {country: TWebPageModule} {*.html},
  countries_dm in 'countries_dm.pas' {countries: TWebPageModule} {*.html},
  demoscript_dm in 'demoscript_dm.pas' {demoscript: TWebPageModule} {*.html},
  inout_dm in 'inout_dm.pas' {inout: TWebPageModule} {*.html};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
