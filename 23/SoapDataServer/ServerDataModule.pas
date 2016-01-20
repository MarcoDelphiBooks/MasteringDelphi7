Unit serverdatamodule;

interface

uses
  SysUtils, Classes, InvokeRegistry, Midas, SOAPMidas, SoapDm, Provider,
  DB, DBTables, DBXpress, FMTBcd, SqlExpr;

type
  ISoapTestDm = interface(IAppServer)
    ['{1F109687-6D8B-4F85-9BF5-EFFC87A9F10F}']
    function GetRecordCount: Integer;
  end;

  TSoapTestDm = class(TSoapDataModule, ISoapTestDm, IAppServer)
    DataSetProvider1: TDataSetProvider;
    SQLConnection1: TSQLConnection;
    SQLDataSet1: TSQLDataSet;
    SQLDataSet2: TSQLDataSet;
  private

  public
    function GetRecordCount: Integer;
  end;

implementation

{$R *.DFM}

procedure TSoapTestDmCreateInstance(out obj: TObject);
begin
  obj := TSoapTestDm.Create(nil);
end;

{ TSoapTestDm }

function TSoapTestDm.GetRecordCount: Integer;
begin
  // read in the record count by running a query
  SQLDataSet2.Open;
  Result := SQLDataSet2.Fields[0].AsInteger;
  SQLDataSet2.Close;
end;

initialization
   InvRegistry.RegisterInvokableClass(TSoapTestDm, TSoapTestDmCreateInstance);
   InvRegistry.RegisterInterface(TypeInfo(ISoapTestDm));
end.
