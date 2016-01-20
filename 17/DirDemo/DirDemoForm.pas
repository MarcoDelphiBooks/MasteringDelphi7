unit DirDemoForm;

interface

{$WARN UNIT_PLATFORM OFF}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Grids, DBGrids, StdCtrls, MdDsDir, ComCtrls, MdDsCustom,
  MdDsList, ShellCtrls;

type
  TForm1 = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ShellTreeView1: TShellTreeView;
    MdDirDataset1: TMdDirDataset;
    MdDirDataset1FileName: TStringField;
    MdDirDataset1TimeStamp: TDateTimeField;
    MdDirDataset1Size: TIntegerField;
    MdDirDataset1Attributes: TStringField;
    MdDirDataset1Folder: TBooleanField;
    procedure ShellTreeView1Change(Sender: TObject; Node: TTreeNode);
  private
    { Private declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.ShellTreeView1Change(Sender: TObject; Node: TTreeNode);
begin
  MdDirDataset1.Close;
  MdDirDataset1.Directory := ShellTreeView1.Path + '\*.*';
  MdDirDataset1.Open;
end;

end.
