program SoapDataClient;

uses
  Forms,
  SoapDataForm in 'SoapDataForm.pas' {FormSDC},
  SoapServerIntf in 'SoapServerIntf.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormSDC, FormSDC);
  Application.Run;
end.
