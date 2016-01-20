program IWSimpleApp;
{PUBDIST}

uses
  IWInitStandAlone,
  ServerController in 'ServerController.pas' {IWServerController: TDataModule},
  IWSimpleAppForm in 'IWSimpleAppForm.pas' {formMain: TIWForm1};

{$R *.res}

begin
  IWRun(TFormMain, TIWServerController);
end.
