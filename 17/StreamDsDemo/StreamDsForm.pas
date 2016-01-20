unit StreamDsForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, Grids, DBGrids, ExtCtrls, DBCtrls, MdDsStream, MdDsCustom;

type
  TForm1 = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Button1: TButton;
    CheckBox1: TCheckBox;
    DBNavigator1: TDBNavigator;
    Button2: TButton;
    MdDataSetStream1Name: TStringField;
    MdDataSetStream1Level: TIntegerField;
    MdDataSetStream1BirthDate: TDateField;
    MdDataSetStream1Stipend: TCurrencyField;
    MdDataSetStream1Email: TStringField;
    MdDataSetStream1Editor: TBooleanField;
    MdDataSetStream1: TMdDataSetStream;
    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
begin
  MdDataSetStream1.CreateTable;
  MdDataSetStream1.Open;
  CheckBox1.Checked := MdDataSetStream1.Active;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  MdDataSetStream1.Active := CheckBox1.Checked;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  MdDataSetStream1.TableName :=
    ExtractFilePath (ParamStr (0)) + 'Contrib.dso';
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  bm: TBookmarkStr;
begin
  bm := MdDataSetStream1.Bookmark;
  MdDataSetStream1.First;
  while not MdDataSetStream1.EOF do
    MdDataSetStream1.Next;
  MdDataSetStream1.Bookmark := bm;
end;

end.
