
unit homepage_dm;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, WebModu, HTTPProd, ReqMulti,
  WebAdapt, WebForm, WebComp, MidItems, WebSess, WebDisp, CompProd,
  PagItems, SiteProd;

type
  TSessionDemo = class(TWebAppPageModule)
    WebAppComponents: TWebAppComponents;
    ApplicationAdapter: TApplicationAdapter;
    PageDispatcher: TPageDispatcher;
    AdapterDispatcher: TAdapterDispatcher;
    SessionsService: TSessionsService;
    PageProducer1: TPageProducer;
    Hits: TAdapterField;
    SessionHits: TAdapterField;
    procedure PageProducerHTMLTag(Sender: TObject; Tag: TTag;
      const TagString: String; TagParams: TStrings;
      var ReplaceText: String);
    procedure WebAppPageModuleBeforeDispatchPage(Sender: TObject;
      const PageName: String; var Handled: Boolean);
    procedure HitsGetValue(Sender: TObject; var Value: Variant);
    procedure SessionHitsGetValue(Sender: TObject; var Value: Variant);
  private
    nHits: Integer;
  public
    { Public declarations }
  end;

  function SessionDemo: TSessionDemo;

implementation

{$R *.dfm}  {*.html}

uses WebReq, WebCntxt, WebFact, Variants;

function SessionDemo: TSessionDemo;
begin
  Result := TSessionDemo(WebContext.FindModuleClass(TSessionDemo));
end;

procedure TSessionDemo.PageProducerHTMLTag(Sender: TObject;
  Tag: TTag; const TagString: String; TagParams: TStrings;
  var ReplaceText: String);
begin
  if TagString = 'SessionID' then
    ReplaceText := WebContext.Session.SessionID
  else if TagString = 'SessionHits' then
    ReplaceText := WebContext.Session.Values ['SessionHits']
end;

procedure TSessionDemo.WebAppPageModuleBeforeDispatchPage(
  Sender: TObject; const PageName: String; var Handled: Boolean);
begin
  // increase application and session hits
  Inc (nHits);
  WebContext.Session.Values ['SessionHits'] :=
    Integer (WebContext.Session.Values ['SessionHits']) + 1;
end;

procedure TSessionDemo.HitsGetValue(Sender: TObject; var Value: Variant);
begin
  Value := nHits;
end;

procedure TSessionDemo.SessionHitsGetValue(Sender: TObject;
  var Value: Variant);
begin
  Value := Integer (WebContext.Session.Values ['SessionHits']);
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebAppPageModuleFactory.Create(TSessionDemo, TWebPageInfo.Create([wpPublished {, wpLoginRequired}], '.html'), caCache));

end.
