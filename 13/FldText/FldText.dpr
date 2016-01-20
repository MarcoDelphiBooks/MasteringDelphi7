program FldText;

uses
  Forms,
  FldTextF in 'FldTextF.pas' {DbaForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDbaForm, DbaForm);
  Application.Run;
end.
