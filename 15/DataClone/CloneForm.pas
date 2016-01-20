unit CloneForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, ADODB, ComCtrls, ToolWin, Grids, DBGrids;

type
  TForm1 = class(TForm)
    DBGrid1: TDBGrid;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ADOTable1: TADOTable;
    ADOTable2: TADOTable;
    DataSource1: TDataSource;
    Splitter1: TSplitter;
    DBGrid2: TDBGrid;
    DataSource2: TDataSource;
    procedure ToolButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.ToolButton1Click(Sender: TObject);
begin
  ADOTable2.Clone(ADOTable1);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  AdoTable1.Open;
end;

end.
