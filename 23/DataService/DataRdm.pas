unit DataRdm;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, DataService_TLB, StdVcl, Provider, DB, DBTables;

type
  TDataServiceObj = class(TRemoteDataModule, IDataServiceObj)
    Table1: TTable;
    DataSetProvider1: TDataSetProvider;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

initialization
  TComponentFactory.Create(ComServer, TDataServiceObj,
    Class_DataServiceObj, ciMultiInstance, tmApartment);
end.
