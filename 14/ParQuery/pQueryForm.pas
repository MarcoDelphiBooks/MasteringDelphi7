unit pQueryForm;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  DBXpress, FMTBcd, DB, SqlExpr, StdCtrls, ExtCtrls, Provider, DBClient,
  DBCtrls, Grids, DBGrids;

type
  TForm1 = class(TForm)
    SQLConnection1: TSQLConnection;
    SQLDataSet1: TSQLDataSet;
    ClientDataSet1: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
    Panel1: TPanel;
    ComboBox1: TComboBox;
    Button1: TButton;
    SQLDataSet2: TSQLDataSet;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    DBNavigator1: TDBNavigator;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  SQLDataSet2.Open;
  while not SQLDataSet2.Eof do
  begin
    ComboBox1.Items.Add(SQLDataSet2.Fields[0].AsString);
    SQLDataSet2.Next;
  end;
  // auto select the first item
  ComboBox1.Text := ComboBox1.Items[0];
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  SQLDataSet1.Close;
  ClientDataSet1.Close;
  SQLDataSet1.Params[0].AsString := ComboBox1.Text;
  SQLDataSet1.Open;
  ClientDataSet1.Open;
end;

end.
