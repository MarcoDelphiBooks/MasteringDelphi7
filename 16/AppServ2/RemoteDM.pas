unit RemoteDM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComServ, ComObj, VCLCom, StdVcl, DataBkr, AppServTwo_TLB, Db,
  DBTables, Provider, DBXpress, FMTBcd, SqlExpr;

type
  TRdmCount = class(TRemoteDataModule, IRdmCount)
    DataSetProvider1: TDataSetProvider;
    SQLConnection1: TSQLConnection;
    SQLDataSet1: TSQLDataSet;
    SQLDataSet1DEPT_NO: TStringField;
    SQLDataSet1EMP_NO: TSmallintField;
    SQLDataSet1FIRST_NAME: TStringField;
    SQLDataSet1HIRE_DATE: TSQLTimeStampField;
    SQLDataSet1JOB_CODE: TStringField;
    SQLDataSet1JOB_COUNTRY: TStringField;
    SQLDataSet1JOB_GRADE: TSmallintField;
    SQLDataSet1LAST_NAME: TStringField;
    SQLDataSet1PHONE_EXT: TStringField;
    SQLDataSet1SALARY: TFMTBCDField;
  protected
    class procedure UpdateRegistry(Register: Boolean; const ClassID,
      ProgID: string); override;
  public
    { Public declarations }
  end;

var
  RdmCount: TRdmCount;

implementation

{$R *.DFM}

class procedure TRdmCount.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
begin
  if Register then
  begin
    inherited UpdateRegistry(Register, ClassID, ProgID);
    EnableSocketTransport(ClassID);
    EnableWebTransport(ClassID);
  end else
  begin
    DisableSocketTransport(ClassID);
    DisableWebTransport(ClassID);
    inherited UpdateRegistry(Register, ClassID, ProgID);
  end;
end;

initialization
  TComponentFactory.Create(ComServer, TRdmCount,
    Class_RdmCount, ciMultiInstance);
end.
