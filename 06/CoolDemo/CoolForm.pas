unit CoolForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ComCtrls, ToolWin, ColorGrd, ImgList;

type
  TCoolbarForm = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    ToolButton5: TToolButton;
    ColorGrid1: TColorGrid;
    Label1: TLabel;
    ImageListHighlight: TImageList;
    ImageListNormal: TImageList;
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ColorGrid1Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CoolbarForm: TCoolbarForm;

implementation

{$R *.DFM}


procedure TCoolbarForm.ToolButton1Click(Sender: TObject);
begin
  Beep;
end;

procedure TCoolbarForm.ToolButton2Click(Sender: TObject);
begin
  Label1.Alignment := taLeftJustify;
end;

procedure TCoolbarForm.ToolButton3Click(Sender: TObject);
begin
  Label1.Alignment := taCenter;
end;

procedure TCoolbarForm.ToolButton4Click(Sender: TObject);
begin
  Label1.Alignment := taRightJustify;
end;

procedure TCoolbarForm.ColorGrid1Change(Sender: TObject);
begin
  Label1.Color := ColorGrid1.BackgroundColor;
  Label1.Font.Color := ColorGrid1.ForegroundColor;
end;

procedure TCoolbarForm.Edit1Change(Sender: TObject);
var
  Value: Integer;
begin
  Value := StrToIntDef (Edit1.Text, 0);
  if Value <> 0 then
    Label1.Font.Size := Value;
end;

procedure TCoolbarForm.FormCreate(Sender: TObject);
begin
  ComboBox1.Items := Screen.Fonts;
  // select the current font
  ComboBox1.ItemIndex := ComboBox1.Items.IndexOf (Font.Name);
end;
               
procedure TCoolbarForm.ComboBox1Change(Sender: TObject);
begin
  Label1.Font.Name := Combobox1.Text;
end;

end.
