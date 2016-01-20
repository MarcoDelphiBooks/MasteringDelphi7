unit MyBase2Form;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, DBClient, {MidasLib,} ComCtrls;

type
  TForm1 = class(TForm)
    DataSource1: TDataSource;
    cds: TClientDataSet;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  if not FileExists (cds.FileName) then
    cds.CreateDataSet;
  cds.Open;
  cds.MergeChangeLog;
  cds.LogChanges := False;
  Memo1.Lines.Text := StringReplace (
    Cds.XMLData, '>', '>' + sLineBreak, [rfReplaceAll]);
end;

procedure TForm1.DBGrid1TitleClick(Column: TColumn);
begin
  cds.IndexFieldNames := Column.Field.FieldName;
end;

end.
