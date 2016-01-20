Unit SoapDataServerDataModule;

interface

uses SysUtils, Classes, InvokeRegistry, Midas, SOAPMidas, SOAPDm, DBXpress,
  FMTBcd, DB, SqlExpr, Provider;

type
  ISampleDataModule = interface(IAppServerSOAP)
    ['{D47A293F-4024-4690-9915-8A68CB273D39}']
    function GetRecordCount: Integer; stdcall;
  end;

  TSampleDataModule = class(TSoapDataModule, ISampleDataModule, IAppServerSOAP, IAppServer)
    DataSetProvider1: TDataSetProvider;
    SQLConnection1: TSQLConnection;
    SQLDataSet1: TSQLDataSet;
    SQLDataSet2: TSQLDataSet;
  public
    function GetRecordCount: Integer; stdcall;
  end;

implementation

{$R *.DFM}

procedure TsampledatamoduleCreateInstance(out obj: TObject);
begin
 obj := Tsampledatamodule.Create(nil);
end;

{ Tsampledatamodule }

function Tsampledatamodule.GetRecordCount: Integer;
begin
  // read in the record count by running a query
  SQLDataSet2.Open;
  Result := SQLDataSet2.Fields[0].AsInteger;
  SQLDataSet2.Close;
end;

initialization
   InvRegistry.RegisterInvokableClass(Tsampledatamodule, TsampledatamoduleCreateInstance);
   InvRegistry.RegisterInterface(TypeInfo(Isampledatamodule));
end.
