
unit XslCustDm;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, WebModu, HTTPProd, ReqMulti,
  xmldom, XMLIntf, WebDisp, WebAdapt, WebComp, msxmldom, XMLDoc, XSLProd,
  Provider, DB, XMLBrokr, DBClient;

type
  Tcustomers = class(TWebAppPageModule)
    XSLPageProducer: TXSLPageProducer;
    WebAppComponents: TWebAppComponents;
    ApplicationAdapter: TApplicationAdapter;
    PageDispatcher: TPageDispatcher;
    AdapterDispatcher: TAdapterDispatcher;
    XMLBroker1: TXMLBroker;
    DataSetProvider1: TDataSetProvider;
    ClientDataSet1: TClientDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function customers: Tcustomers;

implementation

{$R *.dfm}  {*.xsl}

uses WebReq, WebCntxt, WebFact, Variants;

function customers: Tcustomers;
begin
  Result := Tcustomers(WebContext.FindModuleClass(Tcustomers));
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebAppPageModuleFactory.Create(Tcustomers, TWebPageInfo.Create([wpPublished {, wpLoginRequired}], '.xsl'), caCache));

end.
