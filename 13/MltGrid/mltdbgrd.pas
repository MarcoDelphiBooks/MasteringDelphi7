unit mltdbgrd;

interface

uses
  Windows, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables, Grids, DBGrids, StdCtrls, ExtCtrls, DBClient;

type
  TForm1 = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Splitter1: TSplitter;
    Panel1: TPanel;
    ListBox1: TListBox;
    Button1: TButton;
    cds: TClientDataSet;
    procedure Button1Click(Sender: TObject);
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

procedure TForm1.Button1Click(Sender: TObject);
var
  I: Integer;
  BookmarkList: TBookmarkList;
  Bookmark: TBookmarkStr;
begin
  // store the current position
  Bookmark := cds.Bookmark;
  try
    // empty the listbox
    ListBox1.Items.Clear;
    // get the selected rows of the grid
    BookmarkList := DbGrid1.SelectedRows;
    for I := 0 to BookmarkList.Count - 1 do
    begin
      // for each, move the table to that record
      cds.Bookmark := BookmarkList[I];
      // add the name field to the listbox
      ListBox1.Items.Add (cds.FieldByName (
        'Name').AsString);
    end;
  finally
    // go back to the initial record
    cds.Bookmark := Bookmark;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  cds.Open;
end;

end.
