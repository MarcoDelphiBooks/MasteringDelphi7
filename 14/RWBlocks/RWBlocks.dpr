program RWBlocks;

uses
  Forms,
  MainForm in 'MainForm.pas' {FormMain},
  CompaniesForm in 'CompaniesForm.pas' {FormCompanies},
  MainData in 'MainData.pas' {DmMain: TDataModule},
  FreeQueryForm in 'FreeQueryForm.pas' {FormFreeQuery},
  CompaniesData in 'CompaniesData.pas' {DmCompanies: TDataModule},
  ClassesForm in 'ClassesForm.pas' {FormClasses},
  ClassesData in 'ClassesData.pas' {DmClasses: TDataModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TDmMain, DmMain);
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
