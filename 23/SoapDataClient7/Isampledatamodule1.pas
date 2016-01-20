// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://localhost:1024/SoapDataServer7.soapdataserver/wsdl/Isampledatamodule
// Encoding : utf-8
// Version  : 1.0
// (10/30/2002 5:57:10 PM - 1.33.2.5)
// ************************************************************************ //

unit ISampleDataModule1;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, SOAPMidas;

type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Borland types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:int             - "http://www.w3.org/2001/XMLSchema"


  // ************************************************************************ //
  // Namespace : urn:SoapDataServerDataModule-Isampledatamodule
  // soapAction: urn:SoapDataServerDataModule-Isampledatamodule#GetRecordCount
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : Isampledatamodulebinding
  // service   : Isampledatamoduleservice
  // port      : IsampledatamodulePort
  // URL       : http://localhost:1024/SoapDataServer7.soapdataserver/soap/Isampledatamodule
  // ************************************************************************ //
  Isampledatamodule = interface(IAppServerSOAP)
  ['{C5D7FC60-E74E-5ADE-6512-CA6C23A7E6AE}']
    function  GetRecordCount: Integer; stdcall;
  end;



implementation

initialization
  InvRegistry.RegisterInterface(TypeInfo(Isampledatamodule), 'urn:SoapDataServerDataModule-Isampledatamodule', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(Isampledatamodule), 'urn:SoapDataServerDataModule-Isampledatamodule#GetRecordCount');

end. 