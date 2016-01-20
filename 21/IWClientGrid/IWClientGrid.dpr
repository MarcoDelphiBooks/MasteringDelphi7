program IWClientGrid;
{PUBDIST}

uses
  IWInitStandAlone,
  IwDbServerController in 'IwDbServerController.pas' {IWServerController: TDataModule},
  IWClientGridForm in 'IWClientGridForm.pas' {formMain: TIWForm1},
  IwClientGridData in 'IwClientGridData.pas' {DataModule1: TDataModule};

{$R *.res}

begin
  IWRun(TFormMain, TIWServerController);
end.
