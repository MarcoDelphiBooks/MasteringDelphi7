
unit datamod;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, WebModu, DBXpress, FMTBcd,
  DB, SqlExpr, Provider, DBClient, DBLocal, WebAdapt, DBAdapt,
  WebComp, SimpleDS;

type
  TWDataMod = class(TWebDataModule)
    dsaDepartment: TDataSetAdapter;
    ActionDeleteRow: TDataSetAdapterDeleteRowAction;
    ActionFirstRow: TDataSetAdapterFirstRowAction;
    ActionPrevRow: TDataSetAdapterPrevRowAction;
    ActionNextRow: TDataSetAdapterNextRowAction;
    ActionLastRow: TDataSetAdapterLastRowAction;
    ActionEditRow: TDataSetAdapterEditRowAction;
    ActionBrowseRow: TDataSetAdapterBrowseRowAction;
    ActionNewRow: TDataSetAdapterNewRowAction;
    ActionCancel: TDataSetAdapterCancelRowAction;
    ActionApply: TDataSetAdapterApplyRowAction;
    ActionRefreshRow: TDataSetAdapterRefreshRowAction;
    AdaptDEPARTMENT: TDataSetAdapterField;
    AdaptDEPT_NO2: TDataSetAdapterField;
    AdaptHEAD_DEPT: TDataSetAdapterField;
    AdaptLOCATION: TDataSetAdapterField;
    AdaptBUDGET: TDataSetAdapterField;
    dsaEmployee: TDataSetAdapter;
    AdaptEMP_NO: TDataSetAdapterField;
    AdaptFIRST_NAME: TDataSetAdapterField;
    AdaptLAST_NAME: TDataSetAdapterField;
    AdaptDEPT_NO: TDataSetAdapterField;
    AdaptJOB_CODE: TDataSetAdapterField;
    AdaptJOB_COUNTRY: TDataSetAdapterField;
    AdaptSALARY: TDataSetAdapterField;
    ibConnection: TSQLConnection;
    dsDepartment: TDataSource;
    cdsDepartment: TClientDataSet;
    cdsEmployee: TClientDataSet;
    provDepartment: TDataSetProvider;
    provEmployee: TDataSetProvider;
    dataDepartment: TSQLDataSet;
    dataEmployee: TSQLDataSet;
    procedure WebDataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function WDataMod: TWDataMod;

implementation

{$R *.dfm}

uses WebReq, WebCntxt, WebFact, Variants;

function WDataMod: TWDataMod;
begin
  Result := TWDataMod(WebContext.FindModuleClass(TWDataMod));
end;

procedure TWDataMod.WebDataModuleCreate(Sender: TObject);
begin
  cdsDepartment.Open;
  cdsEmployee.Open;
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebDataModuleFactory.Create(TWDataMod, crAlways, caCache));

end.
