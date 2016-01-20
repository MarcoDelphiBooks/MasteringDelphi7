program FishClient;

uses
  Forms,
  FishClientForm in 'FishClientForm.pas' {Form1},
  ISoapFish1 in 'ISoapFish1.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
