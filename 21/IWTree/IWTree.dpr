program IWTree;
{PUBDIST}

uses
  IWInitStandAlone,
  ServerController in 'ServerController.pas' {IWServerController: TDataModule},
  IWTreeForm in 'IWTreeForm.pas' {formTree: TIWForm1};

{$R *.res}

begin
  IWRun(TformTree, TIWServerController);
end.
