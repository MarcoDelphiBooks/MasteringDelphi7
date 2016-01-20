unit XAPPage;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, StdCtrls,
  ExtCtrls, Forms, ComServ, ComObj, StdVcl, AxCtrls, ColorGrd, ComCtrls,
  Dialogs;

type
  TPropertyPage1 = class(TPropertyPage)
    ComboDir: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    EditHeight: TEdit;
    UpDownHeight: TUpDown;
    Label3: TLabel;
    ShapePen: TShape;
    ShapePoint: TShape;
    Label4: TLabel;
    ButtonPen: TButton;
    ButtonPoint: TButton;
    ColorDialog1: TColorDialog;
    CheckFilled: TCheckBox;
    procedure ButtonPenClick(Sender: TObject);
    procedure ButtonPointClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure UpdatePropertyPage; override;
    procedure UpdateObject; override;
  end;

const
  Class_PropertyPage1: TGUID = '{CDA51561-914A-11D0-98D0-444553540000}';

implementation

{$R *.DFM}

procedure TPropertyPage1.UpdatePropertyPage;
begin
  { Update your controls from OleObject }
  ComboDir.ItemIndex := OleObject.Direction;
  CheckFilled.Checked := OleObject.Filled;
  EditHeight.Text := IntToStr (OleObject.ArrowHeight);
  ShapePen.Brush.Color := OleObject.PenColor;
  ShapePoint.Brush.Color := OleObject.FillColor;
end;

procedure TPropertyPage1.UpdateObject;
begin
  { Update OleObject from your controls }
  OleObject.Direction := ComboDir.ItemIndex;
  OleObject.Filled := CheckFilled.Checked;
  OleObject.ArrowHeight := UpDownHeight.Position;
  OleObject.PenColor := ColorToRGB (ShapePen.Brush.Color);
  OleObject.FillColor := ColorToRGB (ShapePoint.Brush.Color);
end;

procedure TPropertyPage1.ButtonPenClick(Sender: TObject);
begin
  with ColorDialog1 do
  begin
    Color := ShapePen.Brush.Color;
    if Execute then
    begin
      ShapePen.Brush.Color := Color;
      Modified; // enable Apply button!
    end;
  end;
end;

procedure TPropertyPage1.ButtonPointClick(Sender: TObject);
begin
  with ColorDialog1 do
  begin
    Color := ShapePoint.Brush.Color;
    if Execute then
    begin
      ShapePoint.Brush.Color := Color;
      Modified; // enable Apply button!
    end;
  end;
end;

initialization
  TActiveXPropertyPageFactory.Create(
    ComServer,
    TPropertyPage1,
    Class_PropertyPage1);
end.
