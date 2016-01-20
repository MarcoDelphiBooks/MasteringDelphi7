program EuroConv;

{$WARNINGS OFF}

uses
  Borland.VCL.Forms,
  EuroForm in 'EuroForm.pas',
  EuroConvConst in 'EuroConvConst.pas';

{$R *.RES}

begin
  Application.Initialize;
  Form1 := TForm1.Create (Application);
  Application.MainForm := Form1;
  Application.Run;
end.
