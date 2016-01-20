unit MdWArrow;

interface

uses
  SysUtils, Windows, Messages, Classes,
  Graphics, Controls, Forms, Dialogs;

type
  TMdWArrowDir = (adUp, adLeft, adDown, adRight);

  TMdWArrow = class (TCustomControl)
  private
    fDirection: TMdWArrowDir;
    fArrowHeight: Integer;
    fFilled: Boolean;
    fPen: TPen;
    fBrush: TBrush;
    fArrowDblClick: TNotifyEvent;
    fArrowPoints: array [0..3] of TPoint;
    procedure ComputePoints;
    procedure SetDirection (Value: TMdWArrowDir);
    procedure SetArrowHeight (Value: Integer);
    procedure SetFilled (Value: Boolean);
    procedure SetPen (Value: TPen);
    procedure SetBrush (Value: TBrush);
    procedure RepaintRequest (Sender: TObject);
    procedure WMLButtonDblClk (var Msg: TWMLButtonDblClk);
      message wm_LButtonDblClk;
  protected
    procedure Paint; override;
    procedure ArrowDblClick; dynamic;
  public
    constructor Create (AOwner: TComponent); override;
    destructor Destroy; override;
    procedure SetBounds (ALeft, ATop, AWidth, AHeight: Integer); override;
  published
    property Width default 50;
    property Height default 20;
    property Direction: TMdWArrowDir
      read fDirection write SetDirection default adRight;
    property ArrowHeight: Integer
      read fArrowHeight write SetArrowHeight default 10;
    property Filled: Boolean
      read fFilled write SetFilled default False;
    property Pen: TPen
      read fPen write SetPen;
    property Brush: TBrush
      read fBrush write SetBrush;
    property OnClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnArrowDblClick: TNotifyEvent
      read fArrowDblClick write fArrowDblClick;
  end;

procedure Register;

implementation

{R ARROW4.DCR}

constructor TMdWArrow.Create (AOwner: TComponent);
begin
  // call the parent constructor
  inherited Create (AOwner);

  // set the default values
  fDirection := adRight;
  Width := 50;
  Height := 20;
  fArrowHeight := 10;
  fFilled := False;

  // create the pen and the brush
  fPen := TPen.Create;
  fBrush := TBrush.Create;

  // set a handler for the OnChange event
  fPen.OnChange := RepaintRequest;
  fBrush.OnChange := RepaintRequest;
end;

destructor TMdWArrow.Destroy;
begin
  // delete the two objects
  fPen.Free;
  fBrush.Free;
  // call the parent destructor
  inherited Destroy;
end;

procedure TMdWArrow.SetDirection (Value: TMdWArrowDir);
begin
  if fDirection <> Value then
  begin
    fDirection := Value;
    ComputePoints;
    Invalidate;
  end;
end;

procedure TMdWArrow.SetArrowHeight (Value: Integer);
begin
  if fArrowHeight <> Value then
  begin
    fArrowHeight := Value;
    ComputePoints;
    Invalidate;
  end;
end;

procedure TMdWArrow.SetFilled (Value: Boolean);
begin
  if fFilled <> Value then
  begin
    fFilled := Value;
    Invalidate;
  end;
end;

procedure TMdWArrow.SetPen (Value: TPen);
begin
  fPen.Assign(Value);
  Invalidate;
end;

procedure TMdWArrow.SetBrush (Value: TBrush);
begin
  fBrush.Assign(Value);
  Invalidate;
end;

procedure TMdWArrow.RepaintRequest (Sender: TObject);
begin
  Invalidate;
end;

procedure TMdWArrow.Paint;
var
  XCenter, YCenter: Integer;
begin
  // compute the center
  YCenter := (Height - 1) div 2;
  XCenter := (Width - 1) div 2;

  // use the current pen and brush
  Canvas.Pen := fPen;
  Canvas.Brush := fBrush;

  // draw the arrow line
  case fDirection of
    adUp: begin
      Canvas.MoveTo (XCenter, Height-1);
      Canvas.LineTo (XCenter, fArrowHeight);
    end;
    adDown: begin
      Canvas.MoveTo (XCenter, 0);
      Canvas.LineTo (XCenter, Height - 1 - fArrowHeight);
    end;
    adLeft: begin
      Canvas.MoveTo (Width - 1, YCenter);
      Canvas.LineTo (fArrowHeight, YCenter);
    end;
    adRight: begin
      Canvas.MoveTo (0, YCenter);
      Canvas.LineTo (Width - 1 - fArrowHeight, YCenter);
    end;
  end;

  // draw the arrow head, eventually filling it
  if fFilled then
    Canvas.Polygon (fArrowPoints)
  else
    Canvas.PolyLine (fArrowPoints);
end;

procedure TMdWArrow.ArrowDblClick;
begin
  // call the handler, if available
  if Assigned (fArrowDblClick) then
    fArrowDblClick (Self);
end;

procedure Register;
begin
  RegisterComponents('Md', [TMdWArrow]);
end;

procedure TMdWArrow.ComputePoints;
var
  XCenter, YCenter: Integer;
begin
  // compute the points of the arrow head
  YCenter := (Height - 1) div 2;
  XCenter := (Width - 1) div 2;

  // set the points depending on the direction
  case fDirection of
    adUp: begin
      fArrowPoints [0] := Point (0, fArrowHeight);
      fArrowPoints [1] := Point (XCenter, 0);
      fArrowPoints [2] := Point (Width-1, fArrowHeight);
      fArrowPoints [3] := Point (0, fArrowHeight);
    end;
    adDown: begin
      fArrowPoints [0] := Point (XCenter, Height - 1);
      fArrowPoints [1] := Point (0, Height - 1 - fArrowHeight);
      fArrowPoints [2] := Point (Width - 1, Height - 1 - fArrowHeight);
      fArrowPoints [3] := Point (XCenter, Height - 1);
    end;
    adLeft: begin
      fArrowPoints [0] := Point (fArrowHeight, Height - 1);
      fArrowPoints [1] := Point (0, YCenter);
      fArrowPoints [2] := Point (fArrowHeight, 0);
      fArrowPoints [3] := Point (fArrowHeight, Height - 1);
    end;
    adRight: begin
      fArrowPoints [0] := Point (Width - 1 - fArrowHeight, Height - 1);
      fArrowPoints [1] := Point (Width - 1 - fArrowHeight, 0);
      fArrowPoints [2] := Point (Width - 1, YCenter);
      fArrowPoints [3] := Point (Width - 1 - fArrowHeight, Height - 1);
    end;
  end; // case
end;

procedure TMdWArrow.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
begin
  inherited SetBounds (ALeft, ATop, AWidth, AHeight);
  ComputePoints;
end;

procedure TMdWArrow.WMLButtonDblClk(var Msg: TWMLButtonDblClk);
var
  HRegion: HRgn;
begin
  // perform default handling
  inherited;

  // compute the arrow head region
  HRegion := CreatePolygonRgn (
    fArrowPoints, 3, WINDING);
  try
    // check whether the click took place in the region
    if PtInRegion (HRegion, Msg.XPos, Msg.YPos) then
      ArrowDblClick;
  finally
    DeleteObject (HRegion);
  end;
end;

end.
