program LibSpeed;

{$WARNINGS OFF}

uses
  Borland.VCL.Forms,
  SpeedForm in 'SpeedForm.pas';

{$R *.res}

begin
  Application.Initialize;
  Form1 := TForm1.Create (Application);
  Application.MainForm := Form1;
  Application.Run;
end.
