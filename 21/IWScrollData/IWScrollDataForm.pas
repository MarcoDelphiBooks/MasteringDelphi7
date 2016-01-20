unit IWScrollDataForm;
{PUBDIST}

interface

uses
  IWAppForm, IWApplication, IWTypes, DB, IWDBStdCtrls, Classes, Controls,
  IWControl, IWGrids, IWDBGrids, IWCompButton;

type
  TformMain = class(TIWAppForm)
    IWDBGrid1: TIWDBGrid;
    DataSource1: TDataSource;
    btnNext: TIWButton;
    btnPrevius: TIWButton;
    procedure IWAppFormCreate(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnPreviusClick(Sender: TObject);
  public
  private
    nPos: Integer;
  end;

implementation
{$R *.dfm}

uses
  ServerController, IWScrollDataModule;

procedure TformMain.IWAppFormCreate(Sender: TObject);
begin
  DataSource1.DataSet.Open;
end;

procedure TformMain.btnNextClick(Sender: TObject);
var
  i: Integer;
begin
  nPos := nPos + 10;
  if nPos > DataSource1.DataSet.RecordCount - 10 then
    nPos := DataSource1.DataSet.RecordCount - 10;
  DataSource1.DataSet.First;
  for i := 0 to nPos do
    DataSource1.DataSet.Next;
end;

procedure TformMain.btnPreviusClick(Sender: TObject);
var
  i: Integer;
begin
  nPos := nPos - 10;
  if nPos < 0 then
    nPos := 0;
  DataSource1.DataSet.First;
  for i := 0 to nPos do
    DataSource1.DataSet.Next;
end;

end.
