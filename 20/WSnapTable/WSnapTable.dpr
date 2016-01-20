program WSnapTable;

{$APPTYPE GUI}

uses
  Forms,
  ComApp,
  wsnapform in 'wsnapform.pas' {Form1},
  table_dm in 'table_dm.pas' {table: TWebAppPageModule} {*.html},
  wsnapdata in 'wsnapdata.pas' {WebDataModule1: TWebDataModule},
  form_dm in 'form_dm.pas' {formview: TWebPageModule} {*.html};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
