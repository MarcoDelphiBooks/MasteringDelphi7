program FormToText;

uses
  Forms,
  FormTextForm in 'FormTextForm.pas' {formText};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TformText, formText);
  Application.Run;
end.
