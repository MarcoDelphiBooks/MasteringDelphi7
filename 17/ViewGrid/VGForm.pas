unit VGForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Grids, DBGrids, ExtCtrls, DBCtrls, MdRView;

type
  TForm1 = class(TForm)
    MdRecordView1: TMdRecordView;
    DataSource1: TDataSource;
    Table1: TTable;
    DBNavigator1: TDBNavigator;
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
