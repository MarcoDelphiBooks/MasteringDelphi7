program QDynaForm;

uses
  QForms,
  DynaMemo in 'DynaMemo.pas';

{$R *.res}

var
  str: string;

begin
  str := '';
  Randomize;
  while Length (str) < 2000 do
    str := str + Char (32 + Random (94));
  ShowStringForm (str);

  Application.Run;
end.
