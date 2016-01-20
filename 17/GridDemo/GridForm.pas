unit GridForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, DBTables, Grids, DBGrids, ExtCtrls, MdDbGrid;

type
  TForm1 = class(TForm)
    MdDbGrid1: TMdDbGrid;
    DataSource1: TDataSource;
    Table1: TTable;
    Panel1: TPanel;
    Button1: TButton;
    Label1: TLabel;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    FontDialog1: TFontDialog;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
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
  MdDbGrid1.LinesPerRow :=
    MdDbGrid1.LinesPerRow + 1;
  Label1.Caption := 'Rows: ' +
    IntToStr (MdDbGrid1.LinesPerRow)
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  MdDbGrid1.LinesPerRow :=
    MdDbGrid1.LinesPerRow - 1;
  Label1.Caption := 'Rows: ' +
    IntToStr (MdDbGrid1.LinesPerRow)
end;


procedure TForm1.Button3Click(Sender: TObject);
begin
  FontDialog1.Font := MdDbGrid1.Font;
  if FontDialog1.Execute then
    MdDbGrid1.Font := FontDialog1.Font;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  FontDialog1.Font := MdDbGrid1.TitleFont;
  if FontDialog1.Execute then
    MdDbGrid1.TitleFont := FontDialog1.Font;
end;

end.
