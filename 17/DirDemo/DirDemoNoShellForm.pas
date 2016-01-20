unit DirDemoNoShellForm;

interface

{$WARN UNIT_PLATFORM OFF}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Grids, DBGrids, StdCtrls, MdDsDir, ComCtrls, MdDsCustom,
  MdDsList, ShellCtrls, FileCtrl;

type
  TForm1 = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    MdDirDataset1: TMdDirDataset;
    MdDirDataset1TimeStamp: TDateTimeField;
    MdDirDataset1Size: TIntegerField;
    MdDirDataset1Attributes: TStringField;
    MdDirDataset1Folder: TBooleanField;
    DirectoryListBox1: TDirectoryListBox;
    MdDirDataset1FileName: TWideStringField;
    procedure DirectoryListBox1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.DirectoryListBox1Change(Sender: TObject);
begin
  MdDirDataset1.Close;
  MdDirDataset1.Directory := DirectoryListBox1.Directory + '\*.*';
  MdDirDataset1.Open;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  DirectoryListBox1.Directory := 'c:\';
end;

end.
