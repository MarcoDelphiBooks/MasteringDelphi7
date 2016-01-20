library Xform1;

uses
  ComServ,
  XForm1_TLB in 'XForm1_TLB.pas',
  FormX1 in 'FormX1.pas' {FormX1: TActiveForm} {FormX1: CoClass};

{$E ocx}

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

{$R *.TLB}

{$R *.RES}

begin
end.
