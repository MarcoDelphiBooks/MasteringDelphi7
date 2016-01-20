library EvtSubscriber;

uses
  ComServ,
  EvtSubscriber_TLB in 'EvtSubscriber_TLB.pas',
  MdComEvents_TLB in 'MdComEvents_TLB.pas',
  Subscriber in 'Subscriber.pas' {InformSubscriber: CoClass};

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

{$R *.TLB}

{$R *.RES}

begin
end.
