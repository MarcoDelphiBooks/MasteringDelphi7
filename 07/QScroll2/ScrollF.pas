unit ScrollF;

interface

uses
  Qt, SysUtils, Classes, QGraphics, QControls, QForms, QDialogs;

type
  TForm2 = class(TForm)
    procedure FormPaint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.xfm}

procedure TForm2.FormPaint(Sender: TObject);
begin
  {draw a yellow line}
  Canvas.Pen.Width := 30;
  Canvas.Pen.Color := clYellow;
  Canvas.MoveTo (30 - HorzScrollbar.Position, 30 - VertScrollbar.Position);
  Canvas.LineTo (1970 - HorzScrollbar.Position, 1970 - VertScrollbar.Position);

  {draw a blue line}
  Canvas.Pen.Color := clNavy;
  Canvas.MoveTo (30 - HorzScrollbar.Position, 1970 - VertScrollbar.Position);
  Canvas.LineTo (1970 - HorzScrollbar.Position, 30 - VertScrollbar.Position);

  {draw a fuchsia square}
  Canvas.Pen.Color := clFuchsia;
  Canvas.Brush.Style := bsClear;
  Canvas.Rectangle (500 - HorzScrollbar.Position, 500 - VertScrollbar.Position,
    1500 - HorzScrollbar.Position, 1500 - VertScrollbar.Position);
end;

end.
