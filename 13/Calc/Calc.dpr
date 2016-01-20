program Calc;

uses
  Forms,
  CalcF in 'CalcF.pas' {CalcForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TCalcForm, CalcForm);
  Application.Run;
end.
