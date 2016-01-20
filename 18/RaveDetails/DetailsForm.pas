unit DetailsForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, SimpleDS, DBClientActns, DBActns, ActnList,
  ToolWin, ActnMan, ActnCtrls, XPStyleActnCtrls, ImgList, DBXpress,
  SqlExpr, Grids, DBGrids, StdCtrls, ComCtrls, RpRave, RpDefine, RpCon,
  RpConDS;

type
  TForm1 = class(TForm)
    dsEmployee: TSimpleDataSet;
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
    DataSourceEmployee: TDataSource;
    RvConnectionEmployee: TRvDataSetConnection;
    RvProject: TRvProject;
    acReport: TAction;
    dsEmployeeEMP_NO: TSmallintField;
    dsEmployeeFIRST_NAME: TStringField;
    dsEmployeeLAST_NAME: TStringField;
    dsEmployeePHONE_EXT: TStringField;
    dsEmployeeHIRE_DATE: TSQLTimeStampField;
    dsEmployeeDEPT_NO: TStringField;
    dsEmployeeJOB_CODE: TStringField;
    dsEmployeeJOB_GRADE: TSmallintField;
    dsEmployeeJOB_COUNTRY: TStringField;
    dsEmployeeSALARY: TFMTBCDField;
    dsEmployeeFULL_NAME: TStringField;
    dsDepartments: TSimpleDataSet;
    SQLConnection1: TSQLConnection;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBGrid1: TDBGrid;
    DataSourceDepartments: TDataSource;
    RvConnectionDepartments: TRvDataSetConnection;
    TabSheet2: TTabSheet;
    DBGrid2: TDBGrid;
    dsDepartmentsDEPT_NO: TStringField;
    dsDepartmentsDEPARTMENT: TStringField;
    dsDepartmentsHEAD_DEPT: TStringField;
    dsDepartmentsMNGR_NO: TSmallintField;
    dsDepartmentsBUDGET: TFMTBCDField;
    dsDepartmentsLOCATION: TStringField;
    dsDepartmentsPHONE_NO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure acReportExecute(Sender: TObject);
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
  dsEmployee.Open;
  dsDepartments.Open;
end;

procedure TForm1.acReportExecute(Sender: TObject);
begin
  RvProject.Execute;
end;

end.
