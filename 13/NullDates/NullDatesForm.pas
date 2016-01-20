unit NullDatesForm;

interface

uses
  Windows, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, StdCtrls, Mask, DBCtrls, DBTables, ExtCtrls, Grids, DBGrids,
  DBClient;

type
  TForm1 = class(TForm)
    cds: TClientDataSet;
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
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    procedure Table1ShipDateGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure Table1ShipDateSetText(Sender: TField; const Text: String);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Table1ShipDateGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if Sender.IsNull then
    Text := '<undefined>'
  else
    Text := Sender.AsString;
end;

procedure TForm1.Table1ShipDateSetText(Sender: TField;
  const Text: String);
begin
  if Text = '' then
    Sender.Clear
  else
    Sender.AsString := Text;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  cds.Open;
end;

end.
