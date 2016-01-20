library PropCom;

uses
  ComServ,
  NumIntf in 'NumIntf.pas',
  NumServ in 'NumServ.pas',
  PropCom_TLB in 'PropCom_TLB.pas';

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

{$R *.TLB}

{$R *.RES}
  
end.
