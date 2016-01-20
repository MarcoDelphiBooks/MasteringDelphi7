unit ArrowForm;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Spin, ExtCtrls, ComCtrls, MdArrow;

type
  TForm1 = class(TForm)
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    PenLabel: TLabel;
    SpinWidth: TSpinEdit;
    SpinHeight: TSpinEdit;
    SpinArrow: TSpinEdit;
    btnTurn: TButton;
    cbFilled: TCheckBox;
    btnBrush: TButton;
    btnPen: TButton;
    ColorDialog1: TColorDialog;
    trackPenWidth: TTrackBar;
    Arrow: TMdArrow;
    procedure btnTurnClick(Sender: TObject);
    procedure cbFilledClick(Sender: TObject);
    procedure btnBrushClick(Sender: TObject);
    procedure btnPenClick(Sender: TObject);
    procedure trackPenWidthChange(Sender: TObject);
    procedure ArrowDoubleClick (Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpinWidthChange(Sender: TObject);
    procedure SpinHeightChange(Sender: TObject);
    procedure SpinArrowChange(Sender: TObject);
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.btnTurnClick(Sender: TObject);
begin
  if Arrow.Direction = High (TMdArrowDir) then
    Arrow.Direction := Low (TMdArrowDir)
  else
    Arrow.Direction := Succ (Arrow.Direction);
end;

procedure TForm1.cbFilledClick(Sender: TObject);
begin
  Arrow.Filled := not Arrow.Filled;
end;

procedure TForm1.btnBrushClick(Sender: TObject);
begin
  ColorDialog1.Color := Arrow.Brush.Color;
  if ColorDialog1.Execute then
    Arrow.Brush.Color := ColorDialog1.Color;
end;

procedure TForm1.btnPenClick(Sender: TObject);
begin
  ColorDialog1.Color := Arrow.Pen.Color;
  if ColorDialog1.Execute then
    Arrow.Pen.Color := ColorDialog1.Color;
end;

procedure TForm1.trackPenWidthChange(Sender: TObject);
begin
  PenLabel.Caption := 'Pen Width: ' +
    IntToStr (trackPenWidth.Position);
  Arrow.Pen.Width := trackPenWidth.Position;
end;

procedure TForm1.ArrowDoubleClick (Sender: TObject);
begin
  ShowMessage ('You have double clicked ' +
    'on the point of the arrow');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  SpinWidth.Value := Arrow.Width;
  SpinHeight.Value := Arrow.Height;
  SpinArrow.Value := Arrow.ArrowHeight;
  cbFilled.Checked := Arrow.Filled;
  trackPenWidth.Position := Arrow.Pen.Width;
  PenLabel.Caption := 'Pen Width: ' +
    IntToStr (trackPenWidth.Position);
end;

procedure TForm1.SpinWidthChange(Sender: TObject);
begin
  Arrow.Width := SpinWidth.Value;
end;

procedure TForm1.SpinHeightChange(Sender: TObject);
begin
  Arrow.Height := SpinHeight.Value;
end;

procedure TForm1.SpinArrowChange(Sender: TObject);
begin
  Arrow.ArrowHeight := SpinArrow.Value;
end;

end.
