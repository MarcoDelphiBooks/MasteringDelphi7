unit DbxMultiForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SqlExpr, DB, Grids, DBGrids, Provider, DBClient, StdCtrls,
  DBLocal, DBTables, DBXpress, FMTBcd, ToolWin,
  DBActns, ActnList, ImgList, ComCtrls, ActnMan, ActnCtrls,
  XPStyleActnCtrls;

type
  TForm1 = class(TForm)
    SQLConnection1: TSQLConnection;
    SQLDataSet1: TSQLDataSet;
    ClientDataSet1: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
    DataSource1: TDataSource;
    ImageList1: TImageList;
    ActionManager1: TActionManager;
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
    ActionToolBar2: TActionToolBar;
    SQLMonitor1: TSQLMonitor;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBGrid1: TDBGrid;
    TabSheet2: TTabSheet;
    MemoLog: TMemo;
    SQLDataSet1EMP_NO: TSmallintField;
    SQLDataSet1FIRST_NAME: TStringField;
    SQLDataSet1LAST_NAME: TStringField;
    SQLDataSet1PHONE_EXT: TStringField;
    SQLDataSet1HIRE_DATE: TSQLTimeStampField;
    SQLDataSet1DEPT_NO: TStringField;
    SQLDataSet1JOB_CODE: TStringField;
    SQLDataSet1JOB_GRADE: TSmallintField;
    SQLDataSet1JOB_COUNTRY: TStringField;
    SQLDataSet1SALARY: TFMTBCDField;
    SQLDataSet1FULL_NAME: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure DoUpdate(DataSet: TDataSet);
    procedure SQLMonitor1LogTrace(Sender: TObject; CBInfo: pSQLTRACEDesc);
  private
  protected
    { Private declarations }

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

function GetDriverVersion (strDriverName: string): Integer;
var
  nInfoSize, nDetSize: DWord;
  pVInfo, pDetail: Pointer;
begin
  // the default, in case there is no version information
  Result := 6;

  // read version information
  nInfoSize := GetFileVersionInfoSize (pChar(strDriverName), nDetSize);
  if nInfoSize > 0 then
  begin
    GetMem (pVInfo, nInfoSize);
    try
       GetFileVersionInfo (pChar(strDriverName), 0, nInfoSize, pVInfo);
       VerQueryValue (pVInfo, '\', pDetail, nDetSize);
       Result := HiWord (TVSFixedFileInfo(pDetail^).dwFileVersionMS);
    finally
      FreeMem (pVInfo);
    end;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  if GetDriverVersion ('dbexpint.dll') <> 7 then
    raise Exception.Create ('Incompatible version of the dbExpress driver "dbexpint.dll" found');
  ClientDataSet1.Open;
end;

procedure TForm1.DoUpdate(DataSet: TDataSet);
begin
  ClientDataSet1.ApplyUpdates(0);
end;

procedure TForm1.SQLMonitor1LogTrace(Sender: TObject;
  CBInfo: pSQLTRACEDesc);
begin
  MemoLog.Lines.Add (CBInfo.pszTrace);
end;

end.
