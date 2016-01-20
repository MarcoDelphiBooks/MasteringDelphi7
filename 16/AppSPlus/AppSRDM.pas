unit AppSRDM;

interface

uses
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, AppSPlus_TLB, StdVcl, Db, Provider, DBTables, Variants;

type
  TAppServerPlus = class(TRemoteDataModule, IAppServerPlus)
    TableCustomer: TTable;
    TableCustomerCustNo: TFloatField;
    TableCustomerCompany: TStringField;
    TableCustomerAddr1: TStringField;
    TableCustomerAddr2: TStringField;
    TableCustomerCity: TStringField;
    TableCustomerState: TStringField;
    TableCustomerZip: TStringField;
    TableCustomerCountry: TStringField;
    TableCustomerPhone: TStringField;
    TableCustomerFAX: TStringField;
    TableCustomerTaxRate: TFloatField;
    TableCustomerContact: TStringField;
    TableCustomerLastInvoiceDate: TDateTimeField;
    Query: TQuery;
    TableOrders: TTable;
    DataSourceCust: TDataSource;
    ProviderCustomer: TDataSetProvider;
    ProviderQuery: TDataSetProvider;
    procedure ProviderQueryGetDataSetProperties(Sender: TObject;
      DataSet: TDataSet; out Properties: OleVariant);
    procedure ProviderCustomerUpdateData(Sender: TObject;
      DataSet: TCustomClientDataSet);
    procedure ProviderCustomerBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
  private
    { Private declarations }
  protected
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
    procedure Login(const Name, Password: WideString); safecall;
  public
    { Public declarations }
  end;

implementation

uses AppSForm;

{$R *.DFM}

class procedure TAppServerPlus.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
begin
  if Register then
  begin
    inherited UpdateRegistry(Register, ClassID, ProgID);
    EnableSocketTransport(ClassID);
    EnableWebTransport(ClassID);
  end else
  begin
    DisableSocketTransport(ClassID);
    DisableWebTransport(ClassID);
    inherited UpdateRegistry(Register, ClassID, ProgID);
  end;
end;

procedure TAppServerPlus.Login(const Name, Password: WideString);
begin
  // TODO: add actual login code...
  if Password <> Name then
    raise Exception.Create ('Wrong name/password combination received')
  else
    Query.Active := True;
  ServerForm.Add ('Login:' + Name + '/' + Password);
end;

procedure TAppServerPlus.ProviderQueryGetDataSetProperties(Sender: TObject;
  DataSet: TDataSet; out Properties: OleVariant);
begin
  Properties := VarArrayCreate([0,1], varVariant);
  Properties[0] := VarArrayOf(['Time', Now, True]);
  Properties[1] := VarArrayOf(['Param', Query.Params[0].AsString, False]);
end;

procedure TAppServerPlus.ProviderCustomerUpdateData(Sender: TObject;
  DataSet: TCustomClientDataSet);
begin
  ServerForm.Add ('ProviderCustomer.OnUpdateData');
end;

procedure TAppServerPlus.ProviderCustomerBeforeUpdateRecord(
  Sender: TObject; SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
begin
  ServerForm.Add ('ProviderCustomer.UpdateRecord');
end;

initialization
  TComponentFactory.Create(ComServer, TAppServerPlus,
    Class_AppServerPlus, ciMultiInstance, tmApartment);
end.
