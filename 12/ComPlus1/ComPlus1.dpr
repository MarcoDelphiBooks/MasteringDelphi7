library ComPlus1;

uses
  ComServ,
  ComPlus1_TLB in 'ComPlus1_TLB.pas',
  ComPObject1 in 'ComPObject1.pas' {ComPlus1Object: CoClass};

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

{$R *.TLB}

{$R *.RES}

begin
end.
