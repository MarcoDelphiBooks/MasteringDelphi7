unit CalcForm;

interface

uses
  Windows, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Grids, DBGrids, DBClient, DBTables, StdCtrls, Mask, DBCtrls, ExtCtrls,
  Provider;

type
  TForm1 = class(TForm)
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    ClientDataSet1Name: TStringField;
    ClientDataSet1Capital: TStringField;
    ClientDataSet1Continent: TStringField;
    ClientDataSet1Area: TFloatField;
    ClientDataSet1Population: TFloatField;
    ClientDataSet1TotalArea: TAggregateField;
    Panel1: TPanel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Button1: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure ClientDataSet1ContinentGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure FormCreate(Sender: TObject);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Label1.Caption :=
    'Area: ' + ClientDataSet1TotalArea.DisplayText + sLineBreak +
    'Population : ' + FormatFloat ('###,###,###', ClientDataSet1.Aggregates [1].Value) + sLineBreak +
    'Number : ' + IntToStr (ClientDataSet1.Aggregates [0].Value);
end;

procedure TForm1.ClientDataSet1ContinentGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if gbFirst in ClientDataSet1.GetGroupState (1) then
    Text := Sender.AsString
  else
    Text := '';
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ClientDataSet1.Open;
end;

end.
