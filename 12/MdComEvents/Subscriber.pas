unit Subscriber;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  ComObj, ActiveX, EvtSubscriber_TLB, StdVcl, MdComEvents_TLB;

type
  TInformSubscriber = class(TAutoObject, IMdInform)
  protected
    procedure Informs(Code: Integer; const Message: WideString); safecall;
  end;

implementation

uses ComServ, Dialogs, SysUtils;

procedure TInformSubscriber.Informs(Code: Integer;
  const Message: WideString);
begin
  ShowMessage ('Message <' + IntToStr (Code) + '>: ' + Message);
end;

initialization
  TAutoObjectFactory.Create(ComServer, TInformSubscriber, Class_InformSubscriber,
    ciMultiInstance, tmApartment);
end.
