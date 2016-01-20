program MouseOne;

uses
  Forms,
  MouseF in 'MouseF.pas' {MouseForm};

{$R *.RES}

begin
  Application.CreateForm(TMouseForm, MouseForm);
  Application.Run;
end.

