unit home_dm;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, WebModu, HTTPProd, ReqMulti,
  WebDisp, WebAdapt, WebComp;

type
  Thome = class(TWebAppPageModule)
    PageProducer: TPageProducer;
    WebAppComponents: TWebAppComponents;
    ApplicationAdapter: TApplicationAdapter;
    PageDispatcher: TPageDispatcher;
    AdapterDispatcher: TAdapterDispatcher;
    AppHitCount: TAdapterField;
    procedure PageDispatcherBeforeDispatchPage(Sender: TObject;
      const PageName: String; var Handled: Boolean);
    procedure AppHitCountGetValue(Sender: TObject; var Value: Variant);
  private
    HitCount: Integer;
  public
    { Public declarations }
  end;

  function home: Thome;

implementation

{$R *.dfm}  {*.html}

uses WebReq, WebCntxt, WebFact, Variants;

function home: Thome;
begin
  Result := Thome(WebContext.FindModuleClass(Thome));
end;

procedure Thome.PageDispatcherBeforeDispatchPage(Sender: TObject;
  const PageName: String; var Handled: Boolean);
begin
  Inc (HitCount);
end;

procedure Thome.AppHitCountGetValue(Sender: TObject; var Value: Variant);
begin
  Value := HitCount;
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebAppPageModuleFactory.Create(Thome, TWebPageInfo.Create([wpPublished {, wpLoginRequired}], '.html'), caCache));

end.
