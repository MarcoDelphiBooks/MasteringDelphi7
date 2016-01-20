unit DbProgrF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, ComCtrls, StdCtrls, Mask, DBTables, DB,
  MdProgr;

type
  TForm1 = class(TForm)
    Table1: TTable;
    Table1OrderNo: TFloatField;
    Table1ItemNo: TFloatField;
    Table1PartNo: TFloatField;
    Table1Qty: TIntegerField;
    Table1Discount: TFloatField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    DBNavigator1: TDBNavigator;
    DBText1: TDBText;
    DataSource2: TDataSource;
    MdDbProgress1: TMdDbProgress;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

end.
