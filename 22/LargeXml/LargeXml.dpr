program LargeXml;

uses
  Forms,
  LargeXmlForm in 'LargeXmlForm.pas' {Form1},
  SaxForm in 'SaxForm.pas',
  saxphilo in 'saxphilo.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
