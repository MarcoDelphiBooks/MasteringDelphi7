unit IWAnotherForm;
{PUBDIST}

interface

uses
  IWAppForm, IWApplication, IWTypes, IWCompButton, Classes, Controls,
  IWControl, IWTreeview, IWExtCtrls, jpeg, Graphics;

type
  Tanotherform = class(TIWAppForm)
    IWButton1: TIWButton;
    IWImage1: TIWImage;
    procedure IWButton1Click(Sender: TObject);
    procedure IWImage1MouseDown(ASender: TObject; const AX, AY: Integer);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController;

procedure Tanotherform.IWButton1Click(Sender: TObject);
begin
  Release;
end;

procedure Tanotherform.IWImage1MouseDown(ASender: TObject; const AX,
  AY: Integer);
var
  aCanvas: TCanvas;
begin
  aCanvas := IWImage1.Picture.Bitmap.Canvas;
  aCanvas.Pen.Width := 8;
  aCanvas.Pen.Color := clGreen;
  aCanvas.Ellipse(Ax - 10, Ay - 10, Ax + 10, Ay + 10);
end;

end.
