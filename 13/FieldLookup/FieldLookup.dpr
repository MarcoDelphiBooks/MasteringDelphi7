program FieldLookup;

uses
  Forms,
  FieldLookupF in 'FieldLookupF.pas' {FormFieldLookup},
  FLookupDm in 'FLookupDm.pas' {DataModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormFieldLookup, FormFieldLookup);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
