unit Child;

interface

uses Windows, Classes, Graphics, Forms, Controls, Menus,
  Dialogs, SysUtils;

type
  TCircleChildForm = class(TForm)
    MainMenu1: TMainMenu;
    Circle1: TMenuItem;
    FillColor1: TMenuItem;
    BorderColor1: TMenuItem;
    BorderSize1: TMenuItem;
    N1: TMenuItem;
    GetPosition1: TMenuItem;
    ColorDialog1: TColorDialog;
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FillColor1Click(Sender: TObject);
    procedure BorderColor1Click(Sender: TObject);
    procedure BorderSize1Click(Sender: TObject);
    procedure GetPosition1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    XCenter, YCenter: Integer;
    BorderSize: Integer;
    BorderColor, FillColor: TColor;
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

procedure TCircleChildForm.FormCreate(Sender: TObject);
begin
  XCenter := - 200;
  YCenter := - 200;
  BorderSize := 1;
  BorderColor := clBlack;
  FillColor := clYellow;
end;

procedure TCircleChildForm.FormPaint(Sender: TObject);
begin
  Canvas.Pen.Width := BorderSize;
  Canvas.Pen.Color := BorderColor;
  Canvas.Brush.Color := FillColor;
  Canvas.Ellipse (XCenter-30, YCenter-30, XCenter+30, YCenter+30);
end;

procedure TCircleChildForm.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  XCenter := X;
  YCenter := Y;
  Refresh;
end;

procedure TCircleChildForm.FillColor1Click(Sender: TObject);
begin
  ColorDialog1.Color := FillColor;
  if ColorDialog1.Execute then
    begin
      FillColor := ColorDialog1.Color;
      Repaint;
    end;
end;

procedure TCircleChildForm.BorderColor1Click(Sender: TObject);
begin
  ColorDialog1.Color := BorderColor;
  if ColorDialog1.Execute then
    begin
      BorderColor := ColorDialog1.Color;
      Repaint;
    end;
end;

procedure TCircleChildForm.BorderSize1Click(Sender: TObject);
var
  InputString: string;
begin
  InputString := IntToStr (BorderSize);
  if InputQuery ('Border', 'Insert width', InputString) then
    begin
      BorderSize := StrToIntDef (InputString, BorderSize);
      Repaint;
    end;
end;

procedure TCircleChildForm.GetPosition1Click(Sender: TObject);
begin
  MessageDlg ('The center of the circle is in the position (' +
    IntToStr (XCenter) + ', ' + IntToStr (YCenter) + ').',
    mtInformation, [mbOk], 0);
end;

procedure TCircleChildForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.

