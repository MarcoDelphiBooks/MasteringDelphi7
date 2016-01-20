// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://localhost:1024/SoapFishServer.SoapAttach/wsdl/ISoapFish
// Encoding : utf-8
// Version  : 1.0
// (10/31/2002 5:30:46 PM - 1.33.2.5)
// ************************************************************************ //

unit ISoapFish1;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns;

type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Borland types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:TSOAPAttachment - "http://www.borland.com/namespaces/Types"
  // !:string          - "http://www.w3.org/2001/XMLSchema"


  // ************************************************************************ //
  // Namespace : urn:SoapFishIntf-ISoapFish
  // soapAction: urn:SoapFishIntf-ISoapFish#%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ISoapFishbinding
  // service   : ISoapFishservice
  // port      : ISoapFishPort
  // URL       : http://localhost:1024/SoapFishServer.SoapAttach/soap/ISoapFish
  // ************************************************************************ //
  ISoapFish = interface(IInvokable)
  ['{B8C10BEF-247F-193D-D255-38D56DD562C4}']
    function  GetCds: TSOAPAttachment; stdcall;
    function  GetImage(const fishName: WideString): TSOAPAttachment; stdcall;
  end;

function GetISoapFish(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): ISoapFish;


implementation

function GetISoapFish(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): ISoapFish;
const
  defWSDL = 'http://localhost:1024/SoapFishServer.SoapAttach/wsdl/ISoapFish';
  defURL  = 'http://localhost:1024/SoapFishServer.SoapAttach/soap/ISoapFish';
  defSvc  = 'ISoapFishservice';
  defPrt  = 'ISoapFishPort';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as ISoapFish);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


initialization
  InvRegistry.RegisterInterface(TypeInfo(ISoapFish), 'urn:SoapFishIntf-ISoapFish', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ISoapFish), 'urn:SoapFishIntf-ISoapFish#%operationName%');

end. 