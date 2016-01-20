program ComPlusClient;

uses
  Forms,
  CpClientForm in 'CpClientForm.pas' {Form1},
  ComPlus1_TLB in 'ComPlus1_TLB.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
