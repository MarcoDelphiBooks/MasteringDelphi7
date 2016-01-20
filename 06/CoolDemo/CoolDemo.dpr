program CoolDemo;

uses
  Forms,
  CoolForm in 'CoolForm.pas' {CoolbarForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TCoolbarForm, CoolbarForm);
  Application.Run;
end.
