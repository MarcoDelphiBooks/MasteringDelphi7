program Pages;

uses
  Forms,
  PagesF in 'PagesF.pas' {Form1};

{$R *.RES}        

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
