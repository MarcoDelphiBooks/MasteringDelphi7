unit BitMenuF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Menus;

type
  TForm1 = class(TForm)
    ShapeDemo: TShape;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Exit1: TMenuItem;
    Shape1: TMenuItem;
    Ellipse1: TMenuItem;
    RoundRec1: TMenuItem;
    Rectang1: TMenuItem;
    Color1: TMenuItem;
    Red1: TMenuItem;
    Green1: TMenuItem;
    Blue1: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    procedure FormResize(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure ColorClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Ellipse1Click(Sender: TObject);
    procedure RoundRec1Click(Sender: TObject);
    procedure Rectang1Click(Sender: TObject);
    procedure ColorMeasureItem(Sender: TObject; ACanvas: TCanvas;
      var Width, Height: Integer);
    procedure ColorDrawItem(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; Selected: Boolean);
    procedure ShapeMeasureItem(Sender: TObject; ACanvas: TCanvas;
      var Width, Height: Integer);
    procedure Ellipse1DrawItem(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; Selected: Boolean);
    procedure RoundRec1DrawItem(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; Selected: Boolean);
    procedure Rectang1DrawItem(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; Selected: Boolean);
  private
    { Private declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormResize(Sender: TObject);
begin
  ShapeDemo.SetBounds (ClientWidth div 6, ClientHeight div 6,
    2 * ClientWidth div 3, 2 * ClientHeight div 3);
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.About1Click(Sender: TObject);
begin
  MessageDlg ('Owner-draw menu example,'#13 +
    'from "Mastering Delphi" by Marco Cantù',
    mtInformation, [mbOK], 0);
end;

procedure TForm1.ColorClick(Sender: TObject);
begin
  ShapeDemo.Brush.Color :=
    (Sender as TComponent).Tag
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Blue1.Tag := clBlue;
  Red1.Tag := clRed;
  Green1.Tag := clGreen;
end;

procedure TForm1.Ellipse1Click(Sender: TObject);
begin
  ShapeDemo.Shape := stEllipse;
end;

procedure TForm1.RoundRec1Click(Sender: TObject);
begin
  ShapeDemo.Shape := stRoundRect;
end;

procedure TForm1.Rectang1Click(Sender: TObject);
begin
  ShapeDemo.Shape := stRectangle;
end;

procedure TForm1.ColorMeasureItem(Sender: TObject;
  ACanvas: TCanvas;
  var Width, Height: Integer);
begin
  Width := 80;
  Height := 30;
end;

procedure TForm1.ColorDrawItem(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; Selected: Boolean);
begin
  // set the background color and draw it
  if Selected then
    ACanvas.Brush.Color := clHighlight
  else
    ACanvas.Brush.Color := clMenu;
  ACanvas.FillRect (ARect);
  // show the color
  ACanvas.Brush.Color := (Sender as TComponent).Tag;
  InflateRect (ARect, -5, -5);
  ACanvas.Rectangle (ARect.Left, ARect.Top,
    ARect.Right, ARect.Bottom);
end;

procedure TForm1.ShapeMeasureItem(Sender: TObject; ACanvas: TCanvas;
  var Width, Height: Integer);
begin
  Width := 90;
  Height := 40;
end;

procedure TForm1.Ellipse1DrawItem(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; Selected: Boolean);
begin
  // set the background color and draw it
  if Selected then
    ACanvas.Brush.Color := clHighlight
  else
    ACanvas.Brush.Color := clMenu;
  ACanvas.FillRect (ARect);
  // draw the ellipse
  ACanvas.Brush.Color := clWhite;
  InflateRect (ARect, -5, -5);
  ACanvas.Ellipse (ARect.Left, ARect.Top,
    ARect.Right, ARect.Bottom);
end;

procedure TForm1.RoundRec1DrawItem(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; Selected: Boolean);
begin
  // set the background color and draw it
  if Selected then
    ACanvas.Brush.Color := clHighlight
  else
    ACanvas.Brush.Color := clMenu;
  ACanvas.FillRect (ARect);
  // draw the round rectangle
  ACanvas.Brush.Color := clWhite;
  InflateRect (ARect, -5, -5);
  ACanvas.RoundRect (ARect.Left, ARect.Top,
    ARect.Right, ARect.Bottom, 5, 5);
end;

procedure TForm1.Rectang1DrawItem(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; Selected: Boolean);
begin
  // set the background color and draw it
  if Selected then
    ACanvas.Brush.Color := clHighlight
  else
    ACanvas.Brush.Color := clMenu;
  ACanvas.FillRect (ARect);
  // draw the rectangle
  ACanvas.Brush.Color := clWhite;
  InflateRect (ARect, -5, -5);
  ACanvas.Rectangle (ARect.Left, ARect.Top,
    ARect.Right, ARect.Bottom);
end;

end.
