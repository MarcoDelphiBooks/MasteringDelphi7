program XmlDomTree;

uses
  Forms,
  DomTreeForm in 'DomTreeForm.pas' {FormXmlTree};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormXmlTree, FormXmlTree);
  Application.Run;
end.
