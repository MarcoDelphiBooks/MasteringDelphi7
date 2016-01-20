unit SchemaForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBXpress, FMTBcd, Provider, DBClient, DB, SqlExpr, Grids,
  DBGrids, StdCtrls;

type
  TFormSchema = class(TForm)
    btnTables: TButton;
    btnFields: TButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    SQLConnection1: TSQLConnection;
    SQLDataSet1: TSQLDataSet;
    ClientDataSet1: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
    procedure btnTablesClick(Sender: TObject);
    procedure btnFieldsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSchema: TFormSchema;

implementation

{$R *.dfm}

procedure TFormSchema.btnTablesClick(Sender: TObject);
begin
  ClientDataSet1.Close;
  SQLDataSet1.SetSchemaInfo (stTables, '', '');
  ClientDataSet1.Open;
end;

procedure TFormSchema.btnFieldsClick(Sender: TObject);
begin
  SQLDataSet1.SetSchemaInfo (stColumns,
    ClientDataSet1['Table_Name'], '');
  ClientDataSet1.Close;
  ClientDataSet1.Open;
end;

end.
