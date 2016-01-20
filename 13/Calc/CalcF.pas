unit CalcF;

interface

uses
  SysUtils, Windows, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, DBTables, Grids, ExtCtrls,
  DBClient;

type
  TCalcForm = class(TForm)
    DBGrid1: TDBGrid;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    Panel2: TPanel;
    DataSource1: TDataSource;
    cds: TClientDataSet;
    cdsName: TStringField;
    cdsCapital: TStringField;
    cdsContinent: TStringField;
    cdsArea: TFloatField;
    cdsPopulation: TFloatField;
    cdsPopulationDensity: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure cdsCalcFields(DataSet: TDataset);
    procedure DBGrid1EditButtonClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  CalcForm: TCalcForm;

implementation

uses Dialogs;

{$R *.dfm}

procedure TCalcForm.FormCreate(Sender: TObject);
begin
  cds.Open;
end;

procedure TCalcForm.cdsCalcFields(DataSet: TDataset);
begin
  // plain version (very dangerous)
{  cdsPopulationDensity.Value :=
    cdsPopulation.Value / cdsArea.Value;}

  // version based on exceptions (ok)
{  try
    cdsPopulationDensity.Value :=
      cdsPopulation.Value / cdsArea.Value;
  except
    on Exception do
      cdsPopulationDensity.Value := 0;
  end;}

  // definitive version
  if not cdsArea.IsNull and
      (cdsArea.Value <> 0) then
    cdsPopulationDensity.Value :=
      cdsPopulation.Value / cdsArea.Value
  else
    cdsPopulationDensity.Value := 0;
end;

procedure TCalcForm.DBGrid1EditButtonClick(Sender: TObject);
begin
  MessageDlg (Format (
    'The population density (%.2n)'#13 +
    'is the Population (%.0n)'#13 +
    'devided by the Area (%.0n).'#13#13 +
    'Edit these two fields to change it.',
    [cdsPopulationDensity.AsFloat,
    cdsPopulation.AsFloat,
    cdsArea.AsFloat]),
    mtInformation, [mbOK], 0);
end;

end.
