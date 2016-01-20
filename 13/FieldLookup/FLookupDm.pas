unit FLookupDm;

interface

uses
  SysUtils, Classes, DB, DBTables, DBClient;

type
  TDataModule1 = class(TDataModule)
    cds: TClientDataSet;
    cds2: TClientDataSet;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    Table1OrderNo: TFloatField;
    Table1CustNo: TFloatField;
    Table1SaleDate: TDateTimeField;
    Table1ShipDate: TDateTimeField;
    Table1EmpNo: TIntegerField;
    Table1ShipToContact: TStringField;
    Table1ShipToAddr1: TStringField;
    Table1ShipToAddr2: TStringField;
    Table1ShipToCity: TStringField;
    Table1ShipToState: TStringField;
    Table1ShipToZip: TStringField;
    Table1ShipToCountry: TStringField;
    Table1ShipToPhone: TStringField;
    Table1ShipVIA: TStringField;
    Table1PO: TStringField;
    Table1Terms: TStringField;
    Table1PaymentMethod: TStringField;
    Table1ItemsTotal: TCurrencyField;
    Table1TaxRate: TFloatField;
    Table1Freight: TCurrencyField;
    Table1AmountPaid: TCurrencyField;
    Table1Employee: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.dfm}

procedure TDataModule1.DataModuleCreate(Sender: TObject);
begin
  cds.Open;
  cds2.Open;
end;

end.
