program IWTwoForms;
{PUBDIST}

uses
  IWInitStandAlone,
  ServerController in 'ServerController.pas' {IWServerController: TDataModule},
  IWMainForm in 'IWMainForm.pas' {formMain: TIWForm1},
  IWAnotherForm in 'IWAnotherForm.pas' {anotherform: TIWAppForm};

{$R *.res}

begin
  IWRun(TFormMain, TIWServerController);
end.
