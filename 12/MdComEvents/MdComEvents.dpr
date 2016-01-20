library MdComEvents;

uses
  ComServ,
  ComObj,
  MdComEvents_TLB in 'MdComEvents_TLB.pas';

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

{$R *.TLB}

{$R *.RES}

type
  // fake abstract class
  TMdInform = class (TAutoObject, IMdInform)
  protected
    procedure Informs(Code: Integer; const Message: WideString);
      virtual; safecall; abstract;
  end;

begin
  TAutoObjectFactory.Create(ComServer, TMdInform, Class_MdInform,
    ciMultiInstance, tmApartment);
end.
