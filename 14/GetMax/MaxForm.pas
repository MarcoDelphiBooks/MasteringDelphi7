unit MaxForm;

interface

uses
  Windows, QTypes, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBXpress, FMTBcd, SqlExpr, DB, DateUtils;

type
  TForm1 = class(TForm)
    BtnTable: TButton;
    BtnQuery: TButton;
    SQLConnection1: TSQLConnection;
    EmpTable: TSQLTable;
    EmpQuery: TSQLQuery;
    procedure BtnTableClick(Sender: TObject);
    procedure BtnQueryClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BtnTableClick(Sender: TObject);
var
  MaxSalary: Double;
  Tick: Cardinal;
begin
  Tick := MilliSecondOfTheDay (Now);
  EmpTable.Open;
  EmpTable.First;
  MaxSalary := 0;
  while not EmpTable.Eof do
  begin
    if EmpTable.FieldByName ('Salary').AsCurrency > MaxSalary then
      MaxSalary := EmpTable.FieldByName ('Salary').AsCurrency;
    EmpTable.Next;
  end;
  Caption := 'Time: ' + IntToStr (MilliSecondOfTheDay (Now) - Tick);
  ShowMessage (FloatToStr (MaxSalary));
end;

procedure TForm1.BtnQueryClick(Sender: TObject);
var
  Tick: Cardinal;
begin
  Tick := MilliSecondOfTheDay (Now);
  EmpQuery.Open;
  Caption := 'Time: ' + IntToStr (MilliSecondOfTheDay (Now) - Tick);
  ShowMessage (EmpQuery.Fields[0].AsString);
end;

end.
