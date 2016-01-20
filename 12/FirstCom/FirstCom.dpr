library FirstCom;

uses
  ComServ,
  NumIntf in 'NumIntf.pas',
  NumServ in 'NumServ.pas',
  FirstCom_TLB in 'FirstCom_TLB.pas';

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

{$R *.TLB}

{$R *.RES}

begin
end.
