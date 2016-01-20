unit DrawForm;

interface

uses
  Windows, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Types,
  DBTables, DB, Grids, DBGrids, ExtCtrls, StdCtrls, DBCtrls, DBClient;

type
  TForm1 = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    cds: TClientDataSet;
    cdsSpeciesNo: TFloatField;
    cdsCategory: TStringField;
    cdsCommon_Name: TStringField;
    cdsSpeciesName: TStringField;
    cdsLengthcm: TFloatField;
    cdsLength_In: TFloatField;
    cdsNotes: TMemoField;
    cdsGraphic: TGraphicField;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure Table1NotesGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure Table1NotesSetText(Sender: TField; const Text: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Picture: TPicture;
  OutRect: TRect;
  PictWidth: Integer;
begin
  // default output rectangle
  OutRect := Rect;

  if Column.Field = cdsCommon_Name then
  begin
    // draw the image
    Picture := TPicture.Create;
    try
      Picture.Assign(cdsGraphic);
      PictWidth := (Rect.Bottom - Rect.Top) * 2;
      OutRect.Right := Rect.Left + PictWidth;
      DBGrid1.Canvas.StretchDraw (OutRect, Picture.Graphic);
    finally
      Picture.Free;
    end;
    // reset output rectangle, leaving space for the graphic
    OutRect := Rect;
    OutRect.Left := OutRect.Left + PictWidth;
  end;

  // red font color if length > 100
  if (Column.Field = cdsLengthcm) and
      (cdsLengthcm.AsInteger > 100) then
    DBGrid1.Canvas.Font.Color := clRed;

  // default drawing
  DBGrid1.DefaultDrawDataCell (OutRect, Column.Field, State);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  cds.Active := True;
end;

procedure TForm1.Table1NotesGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  Text := Trim (Sender.AsString);
end;

procedure TForm1.Table1NotesSetText(Sender: TField; const Text: String);
begin
  Sender.AsString := Text;
end;

end.
