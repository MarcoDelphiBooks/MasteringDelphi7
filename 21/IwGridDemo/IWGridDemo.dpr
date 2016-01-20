program IWGridDemo;
{PUBDIST}

uses
  IWInitStandAlone,
  IWGridController in 'IWGridController.pas' {IWServerController: TDataModule},
  IWGridForm in 'IWGridForm.pas' {GridForm: TIWForm1},
  IWGridData in 'IWGridData.pas' {DataModule1: TDataModule},
  IWRecordForm in 'IWRecordForm.pas' {RecordForm: TIWPageForm};

{$R *.res}

begin
  IWRun(TGridForm, TIWServerController);
end.
