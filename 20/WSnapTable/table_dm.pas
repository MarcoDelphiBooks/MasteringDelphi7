
unit table_dm;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, WebModu, HTTPProd, ReqMulti,
  WebDisp, WebAdapt, WebComp, CompProd, PagItems, SiteProd, DBXpress,
  FMTBcd, MidItems, WebForm, DB, SqlExpr, DBAdapt, Provider, DBClient;

type
  Ttable = class(TWebAppPageModule)
    AdapterPageProducer: TAdapterPageProducer;
    WebAppComponents: TWebAppComponents;
    ApplicationAdapter: TApplicationAdapter;
    PageDispatcher: TPageDispatcher;
    AdapterDispatcher: TAdapterDispatcher;
    DataSetAdapter1: TDataSetAdapter;
    AdapterForm1: TAdapterForm;
    AdapterGrid1: TAdapterGrid;
    AdapterCommandGroup1: TAdapterCommandGroup;
    CmdPrevPage: TAdapterActionButton;
    CmdGotoPage: TAdapterActionButton;
    CmdNextPage: TAdapterActionButton;
    ColCUST_NO: TAdapterDisplayColumn;
    ColCUSTOMER: TAdapterDisplayColumn;
    ColADDRESS_LINE1: TAdapterDisplayColumn;
    ColCITY: TAdapterDisplayColumn;
    ColSTATE_PROVINCE: TAdapterDisplayColumn;
    ColCOUNTRY: TAdapterDisplayColumn;
    AdapterCommandColumn1: TAdapterCommandColumn;
    CmdEditRow: TAdapterActionButton;
    CmdDeleteRow: TAdapterActionButton;
    AdapterCommandGroup2: TAdapterCommandGroup;
    CmdNewRow: TAdapterActionButton;
    AdapterErrorList1: TAdapterErrorList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function table: Ttable;

implementation

{$R *.dfm}  {*.html}

uses WebReq, WebCntxt, WebFact, Variants, wsnapdata;

function table: Ttable;
begin
  Result := Ttable(WebContext.FindModuleClass(Ttable));
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebAppPageModuleFactory.Create(Ttable, TWebPageInfo.Create([wpPublished {, wpLoginRequired}], '.html'), caCache));

end.
