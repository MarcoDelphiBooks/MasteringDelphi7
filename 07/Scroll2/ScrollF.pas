unit ScrollF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

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

{$R *.DFM}

procedure TForm2.FormPaint(Sender: TObject);
begin
  SetWindowOrgEx (Canvas.Handle,
    HorzScrollbar.Position,
    VertScrollbar.Position, nil);

  {draw a yellow line}
  Canvas.Pen.Width := 30;
  Canvas.Pen.Color := clYellow;
  Canvas.MoveTo (30, 30);
  Canvas.LineTo (1970, 1970);

  {draw a blue line}
  Canvas.Pen.Color := clNavy;
  Canvas.MoveTo (30, 1970);
  Canvas.LineTo (1970, 30);

  {draw a fuchsia square}
  Canvas.Pen.Color := clFuchsia;
  Canvas.Brush.Style := bsClear;
  Canvas.Rectangle (500, 500,
    1500, 1500);
end;

end.
