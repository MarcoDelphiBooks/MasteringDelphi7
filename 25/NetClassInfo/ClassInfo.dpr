program ClassInfo;

{$WARNINGS OFF}

uses
  Borland.VCL.Forms,
  InfoForm in 'InfoForm.pas';

{$R *.RES}

begin
  Application.Initialize;
  Form1 := TForm1.Create (Application);
  Application.MainForm := Form1;
  Application.Run;
end.
