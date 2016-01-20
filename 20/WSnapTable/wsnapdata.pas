
unit wsnapdata;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, WebModu, DBXpress, FMTBcd,
  Provider, SqlExpr, DB, DBClient;

type
  TWebDataModule1 = class(TWebDataModule)
    ClientDataSet1: TClientDataSet;
    SQLConnection1: TSQLConnection;
    SQLDataSet1: TSQLDataSet;
    DataSetProvider1: TDataSetProvider;
    procedure ClientDataSet1AfterPost(DataSet: TDataSet);
    procedure ClientDataSet1AfterDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function WebDataModule1: TWebDataModule1;

implementation

{$R *.dfm} 

uses WebReq, WebCntxt, WebFact, Variants;

function WebDataModule1: TWebDataModule1;
begin
  Result := TWebDataModule1(WebContext.FindModuleClass(TWebDataModule1));
end;

procedure TWebDataModule1.ClientDataSet1AfterPost(DataSet: TDataSet);
begin
  ClientDataSet1.ApplyUpdates(-1);
end;

procedure TWebDataModule1.ClientDataSet1AfterDelete(DataSet: TDataSet);
begin
  ClientDataSet1.ApplyUpdates(-1);
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebDataModuleFactory.Create(TWebDataModule1, crAlways, caCache));

end.
