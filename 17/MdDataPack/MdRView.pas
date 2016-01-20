unit MdRView;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DB, StdCtrls;

type
  TMdRecordView = class(TCustomGrid)
  private
    // data-aware support
    FDataLink: TDataLink;
    function GetDataSource: TDataSource;
    procedure SetDataSource (Value: TDataSource);
  protected
    // redefined TCustomGrid methods
    procedure DrawCell(ACol, ARow: Longint; ARect: TRect;
      AState: TGridDrawState); override;
    procedure ColWidthsChanged; override;
    procedure RowHeightsChanged; override;
  public
    constructor Create (AOwner: TComponent); override;
    destructor Destroy; override;
    procedure SetBounds (ALeft, ATop, AWidth,
      AHeight: Integer); override;
    // procedure DefineProperties(Filer: TFiler); override;
    // parent properties
    property Canvas;
    property Col;
    property ColWidths;
    property EditorMode;
    property GridHeight;
    property GridWidth;
    property LeftCol;
    property Selection;
    property Row;
    property RowHeights;
    property TabStops;
    property TopRow;
  published
    // data-aware properties
    property DataSource: TDataSource
      read GetDataSource write SetDataSource;
    // parent properties
    property Align;
    property BorderStyle;
    property Color;
    property Ctl3D;
    property DefaultColWidth;
    property DefaultRowHeight;
    property DragCursor;
    property DragMode;
    property Enabled;
    property FixedColor;
    property Font;
    property GridLineWidth;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Visible;
    property VisibleColCount;
    property VisibleRowCount;
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
  end;

procedure Register;

implementation

////// Custom DataLink //////

type
  TMdRecordLink = class (TDataLink)
  private
    RView: TMdRecordView;
  public
    constructor Create (View: TMdRecordView);
    procedure ActiveChanged; override;
    procedure RecordChanged(Field: TField); override;
  end;

constructor TMdRecordLink.Create (View: TMdRecordView);
begin
  inherited Create;
  RView := View;
end;

procedure TMdRecordLink.ActiveChanged;
var
  I: Integer;
begin
  // set number of rows
  if Assigned (DataSet) then
  begin
    RView.RowCount := DataSet.FieldCount;
    // double the height of memo and graphics
    for I := 0 to DataSet.FieldCount - 1 do
      if DataSet.Fields [I] is TBlobField then
        RView.RowHeights [I] := RView.DefaultRowHeight * 2;
    // repaint all...
    RView.Invalidate;
  end;
end;

procedure TMdRecordLink.RecordChanged;
begin
  inherited;
  // repaint all...
  RView.Invalidate;
end;

////// data-aware component //////

constructor TMdRecordView.Create (AOwner: TComponent);
begin
  FDataLink := TMdRecordLink.Create (self);
  inherited Create (AOwner);
  // set numbers of cells and fixed cells
  RowCount := 2; // default
  ColCount := 2;
  FixedCols := 1;
  FixedRows := 0;
  {grid options -- choose among:
    goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine,
    goRangeSelect, goDrawFocusSelected, goRowSizing, goColSizing,
    goRowMoving, goColMoving, goEditing, goTabs, goRowSelect,
    goAlwaysShowEditor, goThumbTracking}
  Options := [goFixedVertLine, goFixedHorzLine,
    goVertLine, goHorzLine, goRowSizing, goColSizing];
  DefaultDrawing := False;
  ScrollBars := ssVertical;
  FSaveCellExtents := False;
end;

destructor TMdRecordView.Destroy;
begin
  FDataLink.Free;
  FDataLink := nil;
  inherited Destroy;
end;

procedure TMdRecordView.SetBounds (ALeft, ATop,
  AWidth, AHeight: Integer);
begin
  inherited;
  ColWidths [1] := ClientWidth - ColWidths[0];
end;

procedure TMdRecordView.ColWidthsChanged;
begin
  ColWidths [1] := Width - ColWidths [0] -
    GridLineWidth * 3 -
    GetSystemMetrics (sm_CXVScroll)
    - 2; // border
end;

// grid drawing
procedure TMdRecordView.DrawCell(ACol, ARow: Longint;
  ARect: TRect; AState: TGridDrawState);
var
  Text: string;
  CurrField: TField;
  Bmp: TBitmap;
begin
  CurrField := nil;
  Text := '[]'; // default
  // paint background
  if (ACol = 0) then
    Canvas.Brush.Color := FixedColor
  else
    Canvas.Brush.Color := Color;
  Canvas.FillRect (ARect);
  // leave small border
  InflateRect (ARect, -2, -2);
  if (FDataLink.DataSource <> nil) and
    FDataLink.Active then
  begin
    CurrField := FDataLink.DataSet.Fields[ARow];
    if ACol = 0 then
      Text := CurrField.DisplayName
    else if CurrField is TMemoField then
      Text := TMemoField (CurrField).AsString
    else
      Text := CurrField.DisplayText;
  end;
  if (ACol = 1) and (CurrField is TGraphicField) then
  begin
    Bmp := TBitmap.Create;
    try
      Bmp.Assign (CurrField);
      Canvas.StretchDraw (ARect, Bmp);
    finally
      Bmp.Free;
    end;
  end
  else if (ACol = 1) and (CurrField is TMemoField) then
  begin
    DrawText (Canvas.Handle,
      PChar (Text), Length (Text),
      ARect, dt_WordBreak or dt_NoPrefix)
  end
  else // draw single line vertically centered
    DrawText (Canvas.Handle,
      PChar (Text), Length (Text), ARect,
      dt_vcenter or dt_SingleLine or dt_NoPrefix);
  if gdFocused in AState then
    Canvas.DrawFocusRect (ARect);
end;

// data-aware support
function TMdRecordView.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

procedure TMdRecordView.SetDataSource (Value: TDataSource);
begin
  FDataLink.DataSource := Value;
end;

procedure Register;
begin
  RegisterComponents('Md', [TMdRecordView]);
end;

procedure TMdRecordView.RowHeightsChanged;
begin
  inherited;
  // refresh actual values
  (FDataLink as TMdRecordLink).ActiveChanged;
end;

{procedure TMdRecordView.DefineProperties(Filer: TFiler);
begin
  // inherited;
  // skip inherited code, persisting row and column sizes
end;}

end.
