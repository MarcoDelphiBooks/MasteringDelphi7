unit FieldF;

interface

uses
  SysUtils, Windows, Classes, Graphics, Controls, Dialogs,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, DBTables, Grids, ExtCtrls, Buttons,
  Mask, DBClient;

type
  TForm2 = class(TForm)
    DBGrid1: TDBGrid;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    Panel2: TPanel;
    DataSource1: TDataSource;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    DBEdit1: TDBEdit;
    cds: TClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.FormCreate(Sender: TObject);
begin
  cds.Open;
end;

procedure TForm2.SpeedButton1Click(Sender: TObject);
begin
  (cds.FieldByName ('Population') as TFloatField).
    DisplayFormat := '###,###,###';
end;

procedure TForm2.SpeedButton2Click(Sender: TObject);
begin
  ShowMessage (string (cds ['Name']) +
    ': ' + string (cds ['Population']));
end;

procedure TForm2.SpeedButton3Click(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to cds.FieldCount - 1 do
    cds.Fields[I].Alignment := taCenter;
end;

end.
