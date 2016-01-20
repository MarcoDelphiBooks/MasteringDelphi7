unit MdData;

interface

uses
  Windows, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, DBClient;

type
  TDataModule1 = class(TDataModule)
    dsCust: TDataSource;
    dsOrd: TDataSource;
    cdsOrders: TClientDataSet;
    cdsCustomers: TClientDataSet;
    procedure DataModule1Create(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.dfm}

procedure TDataModule1.DataModule1Create(Sender: TObject);
begin
  cdsCustomers.Open;
  cdsOrders.Open;
end;

end.
