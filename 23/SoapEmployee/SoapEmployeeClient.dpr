program SoapEmployeeClient;

uses
  Forms,
  ClientForm in 'ClientForm.pas' {Form1},
  ISoapEmployee1 in 'ISoapEmployee1.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
