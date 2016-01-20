program XmlInterface;

uses
  Forms,
  XmlIntfForm in 'XmlIntfForm.pas' {Form1},
  XmlIntfDefinition in 'XmlIntfDefinition.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
