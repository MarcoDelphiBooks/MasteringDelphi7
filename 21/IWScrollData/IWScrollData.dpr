program IWScrollData;
{PUBDIST}

uses
  IWInitStandAlone,
  ServerController in 'ServerController.pas' {IWServerController: TDataModule},
  IWScrollDataForm in 'IWScrollDataForm.pas' {formMain: TIWForm1},
  IWScrollDataModule in 'IWScrollDataModule.pas' {DataModule1: TDataModule};

{$R *.res}

begin
  IWRun(TFormMain, TIWServerController);
end.
