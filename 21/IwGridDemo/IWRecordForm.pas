unit IWRecordForm;
{PUBDIST}

interface

uses
  IWAppForm, IWApplication, IWTypes, DB, Classes, Controls, IWControl,
  IWGrids, IWDBGrids, IWCompButton, IWDBStdCtrls, IWCompLabel, IWCompEdit;

type
  TRecordForm = class(TIWAppForm)
    IWDBEdit1: TIWDBEdit;
    IWDBEdit2: TIWDBEdit;
    IWDBEdit3: TIWDBEdit;
    IWDBEdit4: TIWDBEdit;
    IWDBNavigator1: TIWDBNavigator;
    IWLabel1: TIWLabel;
    IWLabel2: TIWLabel;
    IWLabel3: TIWLabel;
    IWLabel4: TIWLabel;
    DataSource1: TDataSource;
    IWButton1: TIWButton;
    procedure IWButton1Click(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
  private
    FStartID: string;
    procedure SetStartID(const Value: string);
  public
    property StartID: string read FStartID write SetStartID;
  end;

implementation

uses
  IWGridController, IWGridData;

{$R *.dfm}

procedure TRecordForm.IWButton1Click(Sender: TObject);
begin
  Release;
end;

procedure TRecordForm.IWAppFormCreate(Sender: TObject);
begin
  DataModule1.SimpleDataSet1.Open;
  DataSource1.DataSet := DataModule1.SimpleDataSet1;
end;

procedure TRecordForm.SetStartID(const Value: string);
begin
  FStartID := Value;
  DataSource1.DataSet.Locate('EMP_NO', Value, []);
end;

end.