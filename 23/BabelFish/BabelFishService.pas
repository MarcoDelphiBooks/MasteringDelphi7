// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : E:\books\md7code\23\BabelFish\BabelFishService.xml
// Version  : 1.0
// (10/30/2002 3:09:51 PM - 1.33.2.5)
// ************************************************************************ //

unit BabelFishService;

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
  // !:string          - "http://www.w3.org/1999/XMLSchema"


  // ************************************************************************ //
  // Namespace : urn:xmethodsBabelFish
  // soapAction: urn:xmethodsBabelFish#BabelFish
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : BabelFishBinding
  // service   : BabelFish
  // port      : BabelFishPort
  // URL       : http://services.xmethods.net:80/perl/soaplite.cgi
  // ************************************************************************ //
  BabelFishPortType = interface(IInvokable)
  ['{D2DB6712-EBE0-1DA6-8DEC-8A445595AE0C}']
    function  BabelFish(const translationmode: WideString; const sourcedata: WideString): WideString; stdcall;
  end;

function GetBabelFishPortType(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): BabelFishPortType;


implementation

function GetBabelFishPortType(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): BabelFishPortType;
const
  defWSDL = 'E:\books\md7code\23\BabelFish\BabelFishService.xml';
  defURL  = 'http://services.xmethods.net:80/perl/soaplite.cgi';
  defSvc  = 'BabelFish';
  defPrt  = 'BabelFishPort';
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
    Result := (RIO as BabelFishPortType);
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
  InvRegistry.RegisterInterface(TypeInfo(BabelFishPortType), 'urn:xmethodsBabelFish', '');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(BabelFishPortType), 'urn:xmethodsBabelFish#BabelFish');

end. 