library XClockLib;

uses
  ComServ,
  XClockLib_TLB in 'XClockLib_TLB.pas',
  XClockImpl in 'XClockImpl.pas' {XClock: TActiveForm} {XClock: CoClass};

{$E ocx}

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

{$R *.TLB}

{$R *.RES}

end.
