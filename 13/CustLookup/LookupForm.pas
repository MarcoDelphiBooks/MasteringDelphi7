unit LookupForm;

interface

uses
  SysUtils, Windows, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, ExtCtrls, Grids, Mask, MidasLib,
  DBClient;

type
  TFormLookup = class(TForm)
    ScrollBox: TScrollBox;
    Label1: TLabel;
    EditOrderNo: TDBEdit;
    Label3: TLabel;
    EditSaleDate: TDBEdit;
    Label4: TLabel;
    EditShipToContact: TDBEdit;
    Label5: TLabel;
    EditShipToAddr: TDBEdit;
    Label6: TLabel;
    EditShipToAddr2: TDBEdit;
    Label7: TLabel;
    EditShipToCity: TDBEdit;
    Label8: TLabel;
    EditShipToState: TDBEdit;
    Label9: TLabel;
    EditShipToZip: TDBEdit;
    Label10: TLabel;
    EditShipToCountry: TDBEdit;
    Label11: TLabel;
    EditPaymentMethod: TDBEdit;
    Label12: TLabel;
    EditItemsTotal: TDBEdit;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    DataSourceOrders: TDataSource;
    Panel2: TPanel;
    Label13: TLabel;
    DataSourceCustomer: TDataSource;
    DBLookupComboBox1: TDBLookupComboBox;
    DBText1: TDBText;
    Label2: TLabel;
    cdsOrders: TClientDataSet;
    cdsCustomers: TClientDataSet;
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  FormLookup: TFormLookup;

implementation

{$R *.dfm}

procedure TFormLookup.FormCreate(Sender: TObject);
begin
  cdsCustomers.Open;
  cdsOrders.Open;
end;

end.
