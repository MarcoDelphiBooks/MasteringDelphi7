program TLibDemo;

uses
  Forms,
  MainForm in 'MainForm.pas' {ServerForm},
  DemoObj in 'DemoObj.pas' {FirstServer: CoClass},
  TLibDemo_TLB in 'TLibDemo_TLB.pas';

{$R *.RES}

{$R *.TLB}

begin
  Application.Initialize;
  Application.CreateForm(TServerForm, ServerForm);
  Application.Run;
end.
