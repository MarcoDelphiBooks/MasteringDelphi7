program RichBar;

uses
  Forms,
  RichForm in 'RichForm.pas' {FormRichNote};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFormRichNote, FormRichNote);
  Application.Run;
end.
