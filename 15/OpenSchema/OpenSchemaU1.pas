unit OpenSchemaU1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, ADODB, Grids, DBGrids;

type
  TForm1 = class(TForm)
    DBGrid1: TDBGrid;
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    ADODataSet1: TADODataSet;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure SizeGrid;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  ADOConnection1.Open;
  ADOConnection1.OpenSchema(siPrimaryKeys, EmptyParam, EmptyParam, ADODataSet1);
  SizeGrid;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  Filter: OLEVariant;
begin
  ADOConnection1.Open;
  Filter:=VarArrayCreate([0, 2], varVariant);
  Filter[2]:='CUSTOMER';
  ADOConnection1.OpenSchema(siPrimaryKeys, Filter, EmptyParam, ADODataSet1);
  SizeGrid;
end;

procedure TForm1.SizeGrid;
var
  i: Integer;
begin
  for i := 0 to DBGrid1.Columns.Count - 1 do
    DBGrid1.Columns.Items [i].Width := 100;
end;

end.
