unit ThinForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBClient, MConnect, SConnect, Db, Grids, DBGrids, StdCtrls, ObjBrkr, MidasLib;

type
  TClientForm = class(TForm)
    Connection: TSocketConnection;
    cds: TClientDataSet;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ButtonFetch: TButton;
    Button1: TButton;
    CheckBox1: TCheckBox;
    Edit2: TEdit;
    Edit3: TEdit;
    cdsDet: TClientDataSet;
    DataSource2: TDataSource;
    DBGrid2: TDBGrid;
    cdsCustNo: TFloatField;
    cdsCompany: TStringField;
    cdsAddr1: TStringField;
    cdsAddr2: TStringField;
    cdsCity: TStringField;
    cdsState: TStringField;
    cdsZip: TStringField;
    cdsCountry: TStringField;
    cdsPhone: TStringField;
    cdsFAX: TStringField;
    cdsTaxRate: TFloatField;
    cdsContact: TStringField;
    cdsLastInvoiceDate: TDateTimeField;
    cdsTableOrders: TDataSetField;
    Button2: TButton;
    ConnectionBroker1: TConnectionBroker;
    procedure ButtonFetchClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure ConnectionAfterConnect(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ClientForm: TClientForm;

implementation

uses QueForm;

{$R *.DFM}

procedure TClientForm.ButtonFetchClick(Sender: TObject);
begin
  ButtonFetch.Caption := IntToStr (cds.GetNextPacket);
end;

procedure TClientForm.Button1Click(Sender: TObject);
begin
  cds.ApplyUpdates (-1);
end;

procedure TClientForm.CheckBox1Click(Sender: TObject);
begin
  cds.Active := Checkbox1.Checked;
  cdsDet.Active := Checkbox1.Checked;
  Connection.Connected := Checkbox1.Checked;
end;

procedure TClientForm.ConnectionAfterConnect(Sender: TObject);
begin
  Connection.AppServer.Login (Edit2.Text, Edit3.Text);
end;

procedure TClientForm.Button2Click(Sender: TObject);
begin
  FormQuery.Show;
end;

end.
