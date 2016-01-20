program IndyDbClient;

uses
  Forms,
  IndyDbClientForm in 'IndyDbClientForm.pas' {Form1},
  IndyDbClientThread in 'IndyDbClientThread.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
