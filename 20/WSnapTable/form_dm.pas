
unit form_dm;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, WebModu, HTTPProd,
  CompProd, PagItems, SiteProd, MidItems, WebForm, WebComp;

type
  Tformview = class(TWebPageModule)
    AdapterPageProducer: TAdapterPageProducer;
    AdapterForm1: TAdapterForm;
    AdapterFieldGroup1: TAdapterFieldGroup;
    AdapterCommandGroup1: TAdapterCommandGroup;
    CmdDeleteRow: TAdapterActionButton;
    CmdCancel: TAdapterActionButton;
    CmdApply: TAdapterActionButton;
    FldCUST_NO: TAdapterDisplayField;
    FldCUSTOMER: TAdapterDisplayField;
    FldADDRESS_LINE1: TAdapterDisplayField;
    FldCITY: TAdapterDisplayField;
    FldSTATE_PROVINCE: TAdapterDisplayField;
    FldCOUNTRY: TAdapterDisplayField;
    AdapterErrorList1: TAdapterErrorList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function formview: Tformview;

implementation

{$R *.dfm}  {*.html}

uses WebReq, WebCntxt, WebFact, Variants, table_dm;

function formview: Tformview;
begin
  Result := Tformview(WebContext.FindModuleClass(Tformview));
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebPageModuleFactory.Create(Tformview, TWebPageInfo.Create([{wpPublished, wpLoginRequired}], '.html'), crOnDemand, caCache));

end.
