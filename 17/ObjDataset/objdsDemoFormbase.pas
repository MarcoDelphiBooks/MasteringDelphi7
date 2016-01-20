unit objdsDemoFormbase;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Db, StdCtrls, MdDsObjects, ExtCtrls, DBCtrls;

type
  TForm2 = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    DBNavigator1: TDBNavigator;
    Panel1: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    Objds: TMdObjDataSet;
  end;

var
  Form2: TForm2;

implementation

uses
  ObjdsSampleClass;

{$R *.DFM}

procedure TForm2.FormCreate(Sender: TObject);
begin
  Objds := TMdObjDataSet.Create (self);
  DataSource1.DataSet := Objds;
  Objds.ChangesToClone := True;
  Objds.ObjClass := TDemo;
end;

const
  FirstNames : array [1..10] of string =
    ('John', 'Paul', 'Mark', 'Joseph', 'Bill',
    'Peter', 'Tim', 'Ralph', 'Bob', 'Gary');

procedure TForm2.Button1Click(Sender: TObject);
begin
  Objds.Open;
  with (Objds.Add as TDemo) do
  begin
    Name := FirstNames [Random (High (FirstNames)) + 1];
    Age := 20 + random (50);
    Amount := random (1000000) / 100;
  end;
  Objds.Refresh;
end;

procedure TForm2.Button2Click(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to ObjDs.RecordCount - 1 do
    ShowMessage ((ObjDs.Objects [i] as TDemo).Description);
end;

end.

