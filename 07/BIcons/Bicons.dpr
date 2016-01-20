program Bicons;

uses
  Forms,
  BIconsF in 'BIconsF.pas' {Form1};

{$R *.RES}

begin
  Application.HelpFile := 'BIcons.hlp';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
