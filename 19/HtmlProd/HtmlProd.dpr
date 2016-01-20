program HtmlProd;

uses
  Forms,
  DBHForm in 'DBHForm.pas' {FormProd};

{$R *.RES}

begin
  Application.CreateForm(TFormProd, FormProd);
  Application.Run;
end.
