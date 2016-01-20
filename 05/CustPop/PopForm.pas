unit PopForm;

interface

uses
  SysUtils, Windows, Classes, Graphics, Forms, Controls,
  StdCtrls, Menus, Dialogs, ExtCtrls;

type
  TFormPopup = class(TForm)
    ColorDialog1: TColorDialog;
    PopupMenu1: TPopupMenu;
    BackColor2: TMenuItem;
    PopupMenu2: TPopupMenu;
    Left2: TMenuItem;
    Center2: TMenuItem;
    Right2: TMenuItem;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure Label3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Label1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure Left2Click(Sender: TObject);
    procedure Center2Click(Sender: TObject);
    procedure Right2Click(Sender: TObject);
    procedure BackColor2Click(Sender: TObject);
    procedure Label2ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
  end;

var
  FormPopup: TFormPopup;

implementation

{$R *.DFM}

procedure TFormPopup.Label3MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  ClientPoint, ScreenPoint: TPoint;
begin
  if Button = mbRight then
  begin
    ClientPoint.X := X;
    ClientPoint.Y := Y;
    ScreenPoint := Label3.ClientToScreen (ClientPoint);
    PopupMenu1.Popup (ScreenPoint.X, ScreenPoint.Y)
  end;
end;

procedure TFormPopup.Label1ContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
var
  ScreenPoint: TPoint;
begin
  // add dynamic items
  PopupMenu2.Items.Add (NewLine);
  PopupMenu2.Items.Add (NewItem (TimeToStr (Now),
    0, False, True, nil, 0, ''));
  // show popup
  ScreenPoint := ClientToScreen (MousePos);
  PopupMenu2.Popup (ScreenPoint.X, ScreenPoint.Y);
  Handled := True;
  // remove dynamic items
  PopupMenu2.Items [4].Free;
  PopupMenu2.Items [3].Free;
end;

procedure TFormPopup.Left2Click(Sender: TObject);
begin
  Label1.Alignment := taLeftJustify;
  (Sender as TMenuItem).Checked := True;
end;

procedure TFormPopup.Center2Click(Sender: TObject);
begin
  Label1.Alignment := taCenter;
end;

procedure TFormPopup.Right2Click(Sender: TObject);
begin
  Label1.Alignment := taRightJustify;
end;

procedure TFormPopup.BackColor2Click(Sender: TObject);
begin
  ColorDialog1.Color := Label3.Color;
  if ColorDialog1.Execute then
    Label3.Color := ColorDialog1.Color;
end;

procedure TFormPopup.Label2ContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin
  ColorDialog1.Color := Label2.Color;
  if ColorDialog1.Execute then
    Label2.Color := ColorDialog1.Color;
  Handled := True;
end;

end.

