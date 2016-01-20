unit BmpPreview;

interface

uses
  SysUtils, Windows, Messages, Classes,
  Graphics, Controls, Forms, Dialogs, ExtCtrls,
  Buttons, Printers, StdCtrls;

type
  TPreviewForm = class(TForm)
    Panel1: TPanel;
    ScalePlusButton: TSpeedButton;
    ScaleMinusButton: TSpeedButton;
    PrintButton: TSpeedButton;
    ScrollBox1: TScrollBox;
    Image1: TImage;
    CancelButton: TSpeedButton;
    Label1: TLabel;
    procedure ScalePlusButtonClick(Sender: TObject);
    procedure ScaleMinusButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure PrintButtonClick(Sender: TObject);
  public
    Scale: Integer;
    procedure DrawPreview;
    procedure SetPage;
  end;

var
  PreviewForm: TPreviewForm;

implementation

{$R *.DFM}

uses
  BmpViewForm;

procedure TPreviewForm.SetPage;
begin
  {set the image size to be proportional with the page size}
  Image1.Width := Printer.PageWidth div 5;
  Image1.Height := Printer.PageHeight div 5;
  {output the scale to the toolbar}
  Label1.Caption := IntToStr (Scale);
end;

procedure TPreviewForm.ScalePlusButtonClick(Sender: TObject);
begin
  {increse the size of the bitmap}
  Scale := Scale * 2;
  Label1.Caption := IntToStr (Scale);
  DrawPreview;
end;

procedure TPreviewForm.DrawPreview;
var
  Rect: TRect;
begin
  {compute the rectangle for the bitmap preview}
  Rect.Top := 10;
  Rect.Left := 10;
  Rect.Right := 10 +
    (FormBmpViewer.Image1.Picture.Graphic.Width * Scale) div 5;
  Rect.Bottom := 10 +
    (FormBmpViewer.Image1.Picture.Graphic.Height * Scale) div 5;

  {remove the current image}
  Image1.Canvas.Pen.Mode := pmWhite;
  Image1.Canvas.Rectangle (0, 0, Image1.Width, Image1.Height);

  {stretch the bitmap into the rectangle}
  Image1.Canvas.StretchDraw (Rect,
    FormBmpViewer.Image1.Picture.Graphic);
end;

procedure TPreviewForm.ScaleMinusButtonClick(Sender: TObject);
begin
  {decrease the size of the image}
  if Scale > 1 then
  begin
    Scale := Scale div 2;
    Label1.Caption := IntToStr (Scale);
    DrawPreview;
  end;
end;

procedure TPreviewForm.CancelButtonClick(Sender: TObject);
begin
  {close (hide) the preview dialog}
  Close;
end;

procedure TPreviewForm.PrintButtonClick(Sender: TObject);
var
  Rect: TRect;
begin
  {compute the rectangle for the printer}
  Rect.Top := 10;
  Rect.Left := 10;
  Rect.Right := 10 +
    (FormBmpViewer.Image1.Picture.Graphic.Width * Scale);
  Rect.Bottom := 10 +
    (FormBmpViewer.Image1.Picture.Graphic.Height * Scale);

  {print the bitmap}
  Printer.BeginDoc;
  Printer.Canvas.StretchDraw (Rect,
    FormBmpViewer.Image1.Picture.Graphic);
  Printer.EndDoc;
end;

end.


