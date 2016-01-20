unit FreeQueryForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, ExtCtrls, Grids, DBGrids, IBDatabase, Db,
  IBCustomDataSet, IBQuery;

type
  TFormFreeQuery = class(TForm)
    MemoSql: TMemo;
    Splitter1: TSplitter;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    ButtonRun: TButton;
    DBNavigator1: TDBNavigator;
    dsQueryFree: TDataSource;
    QueryFree: TIBQuery;
    IBTransaction1: TIBTransaction;
    ComboTables: TComboBox;
    procedure ButtonRunClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboTablesChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormFreeQuery: TFormFreeQuery;

implementation

uses MainData;

{$R *.DFM}

procedure TFormFreeQuery.ButtonRunClick(Sender: TObject);
begin
  QueryFree.Close;
  QueryFree.SQL := MemoSql.Lines;
  QueryFree.Open;
end;

procedure TFormFreeQuery.FormCreate(Sender: TObject);
begin
  DmMain.IBDatabase1.GetTableNames (ComboTables.Items);
end;

procedure TFormFreeQuery.ComboTablesChange(Sender: TObject);
begin
  MemoSql.Lines.Text :=
    'select * from ' + ComboTables.Text;
end;

end.
