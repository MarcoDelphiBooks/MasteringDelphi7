unit ConvertWebMod;

interface

uses
  SysUtils, Classes, HTTPApp, WSDLPub, SOAPPasInv, SOAPHTTPPasInv,
  SoapHTTPDisp, WebBrokerSOAP, InvokeRegistry, WSDLIntf, TypInfo,
  WebServExp, WSDLBind, XMLSchema;

type
  TWebModule1 = class(TWebModule)
    HTTPSoapDispatcher1: THTTPSoapDispatcher;
    WSDLHTMLPublish1: TWSDLHTMLPublish;
    HTTPSoapPascalInvoker1: THTTPSoapPascalInvoker;
    procedure WebModule1WebActionItem1Action(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1DefaultHandlerAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WebModule1: TWebModule1;

implementation

{$R *.DFM}

uses
  ConvertIntf;

procedure TWebModule1.WebModule1WebActionItem1Action(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Response.Content :=
    '<h3>GetMethExternalName - ToEuro</h3><p>' +
    InvRegistry.GetMethExternalName(TypeInfo(IConvert), 'ToEuro') +

    '<h3>GetInterfaceExternalName - IConvert</h3><p>' +
    InvRegistry.GetInterfaceExternalName(TypeInfo(IConvert)) +

    '<h3>GetNamespaceByGUID - IConvert</h3><p>' +
    InvRegistry.GetNamespaceByGUID (IConvert);
end;

procedure TWebModule1.WebModule1DefaultHandlerAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  WSDLHTMLPublish1.ServiceInfo(Sender, Request, Response, Handled);
end;

end.
