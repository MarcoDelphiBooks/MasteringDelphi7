program RavePrint;

uses
  Forms,
  RavePrintForm in 'RavePrintForm.pas' {FormRave};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormRave, FormRave);
  Application.Run;
end.
