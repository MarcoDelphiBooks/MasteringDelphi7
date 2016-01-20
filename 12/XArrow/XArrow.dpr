library XArrow;

uses
  ComServ,
  XArrow_TLB in 'XArrow_TLB.pas',
  MdWArrowImpl1 in 'MdWArrowImpl1.pas' {MdWArrowX: CoClass},
  XAPPage in 'XAPPage.pas' {PropertyPage1: TPropertyPage},
  MdWArrow in 'MdWArrow.pas';

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
