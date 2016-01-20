program TLibCli;

uses
  Forms,
  TLibCliF in 'TLibCliF.pas' {ClientForm},
  Tlibdemo_TLB in 'Tlibdemo_TLB.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TClientForm, ClientForm);
  Application.Run;
end.
