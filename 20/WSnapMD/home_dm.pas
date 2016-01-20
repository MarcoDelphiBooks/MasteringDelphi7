
unit home_dm;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, WebModu, HTTPProd, ReqMulti,
  WebAdapt, DBAdapt, WebDisp, WebComp, CompProd, PagItems, SiteProd,
  MidItems, WebForm, DBXpress, DB, DBClient, SimpleDS, SqlExpr;

type
  THomePage = class(TWebAppPageModule)
    AdapterPageProducer: TAdapterPageProducer;
    WebAppComponents: TWebAppComponents;
    ApplicationAdapter: TApplicationAdapter;
    PageDispatcher: TPageDispatcher;
    AdapterDispatcher: TAdapterDispatcher;
    AdapterForm1: TAdapterForm;
    AdapterFieldGroup1: TAdapterFieldGroup;
    AdapterCommandGroup1: TAdapterCommandGroup;
    AdapterGrid1: TAdapterGrid;
    CmdFirstRow: TAdapterActionButton;
    CmdPrevRow: TAdapterActionButton;
    CmdNextRow: TAdapterActionButton;
    CmdLastRow: TAdapterActionButton;
    ColEMP_NO: TAdapterDisplayColumn;
    ColFIRST_NAME: TAdapterDisplayColumn;
    ColLAST_NAME: TAdapterDisplayColumn;
    ColDEPT_NO: TAdapterDisplayColumn;
    ColJOB_CODE: TAdapterDisplayColumn;
    ColJOB_COUNTRY: TAdapterDisplayColumn;
    ColSALARY: TAdapterDisplayColumn;
    FldDEPARTMENT: TAdapterDisplayField;
    FldDEPT_NO: TAdapterDisplayField;
    FldHEAD_DEPT: TAdapterDisplayField;
    FldLOCATION: TAdapterDisplayField;
    FldBUDGET: TAdapterDisplayField;
    procedure ActionNextRowBeforeExecute(Sender: TObject; Params: TStrings;
      var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function HomePage: THomePage;

implementation

{$R *.dfm}  {*.html}

uses WebReq, WebCntxt, WebFact, Variants, datamod;

function HomePage: THomePage;
begin
  Result := THomePage(WebContext.FindModuleClass(THomePage));
end;

procedure THomePage.ActionNextRowBeforeExecute(Sender: TObject;
  Params: TStrings; var Handled: Boolean);
begin
  WDataMod.cdsDepartment.Next;
  Handled := True;
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebAppPageModuleFactory.Create(THomePage, TWebPageInfo.Create([wpPublished {, wpLoginRequired}], '.html'), caCache));

end.
