program CustLookup;

uses
  Forms,
  LookupForm in 'LookupForm.pas' {FormLookup};

{$R *.res}

begin
  Application.CreateForm(TFormLookup, FormLookup);
  Application.Run;
end.
