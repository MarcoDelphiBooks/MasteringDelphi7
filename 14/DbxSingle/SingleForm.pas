unit SingleForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, SimpleDS, DBClientActns, DBActns, ActnList,
  ToolWin, ActnMan, ActnCtrls, XPStyleActnCtrls, ImgList, DBXpress,
  SqlExpr, Grids, DBGrids, StdCtrls, ComCtrls{, dbexpint, MidasLib};

type
  TForm1 = class(TForm)
    SimpleDataSet1: TSimpleDataSet;
    ActionManager1: TActionManager;
    ActionToolBar2: TActionToolBar;
    ImageList1: TImageList;
    DataSetFirst1: TDataSetFirst;
    DataSetPrior1: TDataSetPrior;
    DataSetNext1: TDataSetNext;
    DataSetLast1: TDataSetLast;
    DataSetInsert1: TDataSetInsert;
    DataSetDelete1: TDataSetDelete;
    DataSetEdit1: TDataSetEdit;
    DataSetPost1: TDataSetPost;
    DataSetCancel1: TDataSetCancel;
    DataSetRefresh1: TDataSetRefresh;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Memo1: TMemo;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    SQLMonitor1: TSQLMonitor;
    procedure FormCreate(Sender: TObject);
    procedure SQLMonitor1Trace(Sender: TObject; CBInfo: pSQLTRACEDesc;
      var LogTrace: Boolean);
    procedure DoUpdate(DataSet: TDataSet);
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
  SQLMonitor1.SQLConnection := SimpleDataSet1.Connection;
  SQLMonitor1.Active := True;
  SimpleDataSet1.Active := True;
end;

procedure TForm1.SQLMonitor1Trace(Sender: TObject; CBInfo: pSQLTRACEDesc;
  var LogTrace: Boolean);
begin
  Memo1.Lines := SQLMonitor1.TraceList;
end;

procedure TForm1.DoUpdate(DataSet: TDataSet);
begin
  SimpleDataSet1.ApplyUpdates(0);
end;

end.
