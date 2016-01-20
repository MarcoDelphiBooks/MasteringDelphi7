unit RepProgF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls,
  Forms, Dialogs, Grids, DBGrids, ComCtrls, StdCtrls, Mask,
  DBCtrls, DBCGrids, Db, DBTables, MdRepPr;

type
  TForm1 = class(TForm)
    DBCtrlGrid1: TDBCtrlGrid;
    DBEdit1: TDBEdit;
    MdDbRepProgress1: TMdDbRepProgress;
    DBGrid1: TDBGrid;
    Table1: TTable;
    DataSource1: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

end.
