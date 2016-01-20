{ SOAP Web Module - WAD }
unit SoapFishModule;

interface

uses
  SysUtils, Classes, HTTPApp, InvokeRegistry, WSDLIntf, TypInfo,
  WebServExp, WSDLBind, XMLSchema, WSDLPub, SOAPPasInv, SOAPHTTPPasInv,
  SOAPHTTPDisp, WebBrokerSOAP, DB, DBTables, DBClient;

type
  TWebModule2 = class(TWebModule)
    HTTPSoapDispatcher1: THTTPSoapDispatcher;
    HTTPSoapPascalInvoker1: THTTPSoapPascalInvoker;
    WSDLHTMLPublish1: TWSDLHTMLPublish;
    cdsFish: TClientDataSet;
    cdsFishSpeciesNo: TFloatField;
    cdsFishCategory: TStringField;
    cdsFishCommon_Name: TStringField;
    cdsFishSpeciesName: TStringField;
    cdsFishLengthcm: TFloatField;
    cdsFishLength_In: TFloatField;
    cdsFishNotes: TMemoField;
    cdsFishGraphic: TGraphicField;
    procedure WebModule2DefaultHandlerAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WebModule2: TWebModule2;

implementation

uses WebReq;

{$R *.dfm}

procedure TWebModule2.WebModule2DefaultHandlerAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  WSDLHTMLPublish1.ServiceInfo(Sender, Request, Response, Handled);
end;

procedure TWebModule2.WebModuleCreate(Sender: TObject);
begin
  cdsFish.Open;
end;

initialization
  WebRequestHandler.WebModuleClass := TWebModule2;

end.
