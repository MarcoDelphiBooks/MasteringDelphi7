
unit Login_dm;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, WebModu, HTTPProd,
  WebAdapt, WebComp, CompProd, PagItems, SiteProd, WebForm, MidItems;

type
  Tloginform = class(TWebPageModule)
    AdapterPageProducer: TAdapterPageProducer;
    LoginFormAdapter1: TLoginFormAdapter;
    AdapterForm1: TAdapterForm;
    AdapterFieldGroup1: TAdapterFieldGroup;
    AdapterCommandGroup1: TAdapterCommandGroup;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function loginform: Tloginform;

implementation

{$R *.dfm}  {*.html}

uses WebReq, WebCntxt, WebFact, Variants;

function loginform: Tloginform;
begin
  Result := Tloginform(WebContext.FindModuleClass(Tloginform));
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebPageModuleFactory.Create(Tloginform, TWebPageInfo.Create([{wpPublished , wpLoginRequired}], '.html'), crOnDemand, caCache));

end.
