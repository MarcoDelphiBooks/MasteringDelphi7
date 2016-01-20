// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://localhost:1024/SoapEmployeeServer.soapempl/wsdl/ISoapEmployee
// Encoding : utf-8
// Version  : 1.0
// (29/10/2002 16.19.22 - 1.33.2.5)
// ************************************************************************ //

unit ISoapEmployee1;

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
  // !:string          - "http://www.w3.org/2001/XMLSchema"


  // ************************************************************************ //
  // Namespace : urn:SoapEmployeeIntf-ISoapEmployee
  // soapAction: urn:SoapEmployeeIntf-ISoapEmployee#%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ISoapEmployeebinding
  // service   : ISoapEmployeeservice
  // port      : ISoapEmployeePort
  // URL       : http://localhost:1024/SoapEmployeeServer.soapempl/soap/ISoapEmployee
  // ************************************************************************ //
  ISoapEmployee = interface(IInvokable)
  ['{6034E5D3-2EAF-1530-7B8E-8F609CDE63D4}']
    function  GetEmployeeNames: WideString; stdcall;
    function  GetEmployeeData(const EmpID: WideString): WideString; stdcall;
  end;

function GetISoapEmployee(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): ISoapEmployee;


implementation

function GetISoapEmployee(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): ISoapEmployee;
const
  defWSDL = 'http://localhost:1024/SoapEmployeeServer.soapempl/wsdl/ISoapEmployee';
  defURL  = 'http://localhost:1024/SoapEmployeeServer.soapempl/soap/ISoapEmployee';
  defSvc  = 'ISoapEmployeeservice';
  defPrt  = 'ISoapEmployeePort';
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
    Result := (RIO as ISoapEmployee);
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
  InvRegistry.RegisterInterface(TypeInfo(ISoapEmployee), 'urn:SoapEmployeeIntf-ISoapEmployee', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ISoapEmployee), 'urn:SoapEmployeeIntf-ISoapEmployee#%operationName%');

end.