program QBicons;

uses
  QForms,
  BIconsF in 'BIconsF.pas' {Form1};

{$R *.res}

begin
  Application.HelpFile := 'BIcons.hlp';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
