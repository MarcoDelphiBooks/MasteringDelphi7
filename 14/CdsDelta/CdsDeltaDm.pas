unit CdsDeltaDm;

interface

uses
  SysUtils, Classes, FMTBcd, DBXpress, DB, SqlExpr, DBClient, Provider;

type
  TDmCds = class(TDataModule)
    cdsEmployee: TClientDataSet;
    cdsDelta: TClientDataSet;
    SQLConnection: TSQLConnection;
    EmplData: TSQLDataSet;
    EmplProvider: TDataSetProvider;
    cdsDeltaStatus: TStringField;
    cdsEmployeeStatus: TStringField;
    cdsEmployeeDEPT_NO: TStringField;
    cdsEmployeeEMP_NO: TSmallintField;
    cdsEmployeeFIRST_NAME: TStringField;
    cdsEmployeeLAST_NAME: TStringField;
    cdsEmployeePHONE_EXT: TStringField;
    cdsDeltaDEPT_NO: TStringField;
    cdsDeltaEMP_NO: TSmallintField;
    cdsDeltaFIRST_NAME: TStringField;
    cdsDeltaLAST_NAME: TStringField;
    cdsDeltaPHONE_EXT: TStringField;
    cdsEmployeeSALARY: TFMTBCDField;
    cdsDeltaSALARY: TFMTBCDField;
    procedure CalcStatusField(DataSet: TDataSet);
    procedure cdsEmployeeReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmCds: TDmCds;

implementation

{$R *.dfm}

uses
  TypInfo, Reconc;

procedure TDmCds.CalcStatusField(DataSet: TDataSet);
begin
  DataSet.FieldByName('Status').AsString :=
    GetEnumName (TypeInfo(TUpdateStatus),
      Integer ((DataSet as TClientDataSet).UpdateStatus));
end;

procedure TDmCds.cdsEmployeeReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  Action := HandleReconcileError(DataSet, UpdateKind, E);
end;

end.
