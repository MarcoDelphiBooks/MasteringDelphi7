unit IWClientGridForm;
{PUBDIST}

interface

uses
  IWAppForm, IWApplication, IWTypes, IWDBStdCtrls, Classes, Controls,
  IWControl, IWGrids, IWDBGrids, DB, IWClientSideDatasetBase,
  IWClientSideDatasetDBLink, IWDynGrid;

type
  TformMain = class(TIWAppForm)
    DataSource1: TDataSource;
    IWDynGrid1: TIWDynGrid;
    IWClientSideDatasetDBLink1: TIWClientSideDatasetDBLink;
    procedure IWAppFormCreate(Sender: TObject);
  public
  end;

implementation
{$R *.dfm}

uses
  IwDbServerController, IwClientGridData;

procedure TformMain.IWAppFormCreate(Sender: TObject);
begin
  DataSource1.DataSet := DataModule1.SimpleDataSet1;
end;

end.