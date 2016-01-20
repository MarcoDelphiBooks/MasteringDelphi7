unit MouseF;

interface

uses Qt, Classes, QGraphics,
  QControls, QForms, SysUtils, Types;

type
  TMouseForm = class(TForm)
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormPaint(Sender: TObject);
  private
    fDragging: Boolean;
    fRect: TRect;
  public
    { Public declarations }
  end;

var
  MouseForm: TMouseForm;

implementation

{$R *.xfm}

procedure TMouseForm.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
  begin
    fDragging := True;
    Mouse.Capture := Self; // the form captures the mouse
    fRect.Left := X;
    fRect.Top := Y;
    fRect.BottomRight := fRect.TopLeft;
    Canvas.DrawFocusRect (fRect);
  end;
end;

procedure TMouseForm.FormMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  // display the position of the mouse in the caption
  Caption := Format ('Mouse in x=%d, y=%d', [X, Y]);
  if fDragging then
  begin
    // remove and redraw the dragging rectangle
    Canvas.DrawFocusRect (fRect);
    fRect.Right := X;
    fRect.Bottom := Y;
    Canvas.DrawFocusRect (fRect);
  end
  else
    if ssShift in Shift then
    begin
      // mark points in yellow
      Canvas.Pen.Color := clYellow;
      Canvas.DrawPoint (X, Y);
    end;
end;

procedure TMouseForm.FormMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if fDragging then
  begin
    Mouse.Capture := nil; // release the mouse capture
    fDragging := False;
    Invalidate;
  end;
end;

procedure TMouseForm.FormPaint(Sender: TObject);
begin
  Canvas.Pen.Color := clBlue;
  Canvas.Rectangle (fRect.Left, fRect.Top,
    fRect.Right, fRect.Bottom);
end;

end.

