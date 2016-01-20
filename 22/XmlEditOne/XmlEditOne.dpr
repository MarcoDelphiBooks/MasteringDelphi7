program XmlEditOne;

uses
  Forms,
  XmlEditForm in 'XmlEditForm.pas' {FormXmlEdit};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFormXmlEdit, FormXmlEdit);
  Application.Run;
end.
