program SchemaTest;

uses
  Forms,
  SchemaForm in 'SchemaForm.pas' {FormSchema};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormSchema, FormSchema);
  Application.Run;
end.
