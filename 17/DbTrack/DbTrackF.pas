unit DbTrackF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls,
  Forms, Dialogs, DB, ExtCtrls, DBCtrls, StdCtrls, ComCtrls,
  DBTables, Mask, MdTrack;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBText1: TDBText;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit5: TDBEdit;
    DBNavigator1: TDBNavigator;
    Table1: TTable;
    Table1OrderNo: TFloatField;
    Table1ItemNo: TFloatField;
    Table1PartNo: TFloatField;
    Table1Qty: TIntegerField;
    Table1Discount: TFloatField;
    DataSource2: TDataSource;
    MdDbTrack1: TMdDbTrack;
    MdDbTrack2: TMdDbTrack;
    CheckTable: TCheckBox;
    BtnConnect: TButton;
    BtnDisconnect: TButton;
    Bevel1: TBevel;
    procedure CheckTableClick(Sender: TObject);
    procedure BtnConnectClick(Sender: TObject);
    procedure BtnDisconnectClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.CheckTableClick(Sender: TObject);
begin
  Table1.Active := CheckTable.Checked;
end;

procedure TForm1.BtnConnectClick(Sender: TObject);
begin
  MdDbTrack2.DataField := 'Discount';
end;

procedure TForm1.BtnDisconnectClick(Sender: TObject);
begin
  MdDbTrack2.DataField := '';
end;

end.
