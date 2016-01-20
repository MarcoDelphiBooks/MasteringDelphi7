unit ServerDataModule;

interface

uses
  SysUtils, Classes, DBXpress, FMTBcd, DB, SqlExpr;

type
  TDataModule3 = class(TDataModule)
    SQLConnection: TSQLConnection;
    dsEmplList: TSQLDataSet;
    dsEmpData: TSQLDataSet;
    dsEmplListEMP_NO: TSmallintField;
    dsEmplListLAST_NAME: TStringField;
    dsEmplListFIRST_NAME: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule3: TDataModule3;

implementation

{$R *.dfm}

end.
