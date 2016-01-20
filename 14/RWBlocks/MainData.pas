unit MainData;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, IBQuery, IBCustomDataSet, IBTable, IBDatabase;

type
  TDmMain = class(TDataModule)
    IBDatabase1: TIBDatabase;
    QueryId: TIBQuery;
    IBTransaction2: TIBTransaction;
  public
    function GetNewId: Integer;
  end;

var
  DmMain: TDmMain;

implementation

{$R *.DFM}

function TDmMain.GetNewId: Integer;
begin
  // return the next value of the generator
  QueryId.Open;
  try
    Result := QueryId.Fields[0].AsInteger;
  finally
    QueryId.Close;
  end;
end;

end.
