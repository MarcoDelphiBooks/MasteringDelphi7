program CdsDelta;

uses
  Forms,
  CdsDeltaForm in 'CdsDeltaForm.pas' {FormCds},
  CdsDeltaDm in 'CdsDeltaDm.pas' {DmCds: TDataModule},
  Reconc in 'Reconc.pas' {ReconcileErrorForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TDmCds, DmCds);
  Application.CreateForm(TFormCds, FormCds);
  Application.Run;
end.
