unit IWGridForm;
{PUBDIST}

interface

uses
  IWAppForm, IWApplication, IWTypes, DB, Classes, Controls, IWControl,
  IWGrids, IWDBGrids, IWCompButton, IWDBStdCtrls, IWHTMLControls;

type
  TGridForm = class(TIWAppForm)
    IWDBGrid1: TIWDBGrid;
    DataSource1: TDataSource;
    procedure IWAppFormCreate(Sender: TObject);
    procedure IWDBGrid1Columns1Click(ASender: TObject;
      const AValue: String);
  public
  end;

implementation
{$R *.dfm}

uses
  IWGridController, IWGridData, IWRecordForm, IWForm;

procedure TGridForm.IWAppFormCreate(Sender: TObject);
begin
  DataModule1.SimpleDataSet1.Open;
  DataSource1.DataSet := DataModule1.SimpleDataSet1;
end;

procedure TGridForm.IWDBGrid1Columns1Click(ASender: TObject;
  const AValue: String);
begin
  with TRecordForm.Create (WebApplication) do
  begin
    StartID := AValue;
    Show;
  end;
end;

end.
