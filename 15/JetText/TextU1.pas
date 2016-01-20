unit TextU1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Db, ADODB;

type
  TForm1 = class(TForm)
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
var
  sl: TStringList;
begin
  sl := TStringList.Create;
  sl.Text := StringReplace (ADOTable1.ConnectionString,
    ';', sLineBreak, [rfReplaceAll]);
  sl.Values ['Data Source'] := ExtractFilePath (Application.ExeName);
  ADOTable1.ConnectionString := StringReplace (sl.Text,
    sLineBreak, ';', [rfReplaceAll]);
  ADOTable1.Open;
  sl.Free;  
end;

end.
