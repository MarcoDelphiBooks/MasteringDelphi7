program AppSPlus;

uses
  Forms,
  AppSForm in 'AppSForm.pas' {ServerForm},
  AppSPlus_TLB in 'AppSPlus_TLB.pas',
  AppSRDM in 'AppSRDM.pas' {AppServerPlus: TRemoteDataModule} {AppServerPlus: CoClass};

{$R *.TLB}

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TServerForm, ServerForm);
  Application.Run;
end.
