unit CliRefForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBClient, Grids, DBGrids, MConnect;

type
  TForm1 = class(TForm)
    cds: TClientDataSet;
    DCOMConnection1: TDCOMConnection;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    ListBox1: TListBox;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure cdsAfterPost(DataSet: TDataSet);
    procedure cdsAfterScroll(DataSet: TDataSet);
    procedure Button2Click(Sender: TObject);
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

type
  TMyGrid = class (TDBGrid)
  end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if cds.ChangeCount = 0 then
    cds.Refresh;
end;

procedure TForm1.cdsAfterPost(DataSet: TDataSet);
begin
  cds.ApplyUpdates (-1);
end;

procedure TForm1.cdsAfterScroll(DataSet: TDataSet);
begin
  // refresh current record only
  if cds.UpdateStatus = usUnModified then
    cds.RefreshRecord;
  // log operation
  Listbox1.Items.Add (cds['Emp_no']);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  i: Integer;
  bm: TBookmarkStr;
begin
  // refresh visible rows
  cds.DisableControls;
  // start with the current row
  i := TMyGrid(DbGrid1).Row;
  bm := cds.Bookmark;
  try
    // get back t the first visible record
    while i > 1 do
    begin
      cds.Prior;
      Dec (i);
    end;
    // return to the current record
    i := TMyGrid(DbGrid1).Row;
    cds.Bookmark := bm;
    // go ahead until the grid is complete
    while i < TMyGrid(DbGrid1).RowCount do
    begin
      cds.Next;
      Inc (i);
    end;
  finally
    // set back everything and refresh
    cds.Bookmark := bm;
    cds.EnableControls;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  cds.Active := True;
end;

end.
