program QLibSpeed;

uses
  QForms,
  QSpeedForm in 'QSpeedForm.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
