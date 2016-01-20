unit SplitFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, ComCtrls;

type
  TForm1 = class(TForm)
    ListBox1: TListBox;
    ListBox2: TListBox;
    ListBox3: TListBox;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Panel1: TPanel;
    SpeedBeveled: TSpeedButton;
    SpeedColor: TSpeedButton;
    ColorDialog1: TColorDialog;
    LabelMin: TLabel;
    EditMin: TEdit;
    UpDownMin: TUpDown;
    LabelWidth: TLabel;
    EditWidth: TEdit;
    UpDownWidth: TUpDown;
    FontDialog1: TFontDialog;
    procedure SpeedBeveledClick(Sender: TObject);
    procedure SpeedColorClick(Sender: TObject);
    procedure UpDownMinClick(Sender: TObject; Button: TUDBtnType);
    procedure UpDownWidthClick(Sender: TObject; Button: TUDBtnType);
    procedure OnListClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}





procedure TForm1.SpeedBeveledClick(Sender: TObject);
begin
  Splitter1.Beveled := SpeedBeveled.Down;
  Splitter2.Beveled := SpeedBeveled.Down;  
end;

procedure TForm1.SpeedColorClick(Sender: TObject);
begin
  with ColorDialog1 do
    if Execute then
    begin
      Splitter1.Color := Color;
      Splitter2.Color := Color;
    end;
end;

procedure TForm1.UpDownMinClick(Sender: TObject; Button: TUDBtnType);
begin
  Splitter1.MinSize := UpDownMin.Position;
  Splitter2.MinSize := UpDownMin.Position;
end;

procedure TForm1.UpDownWidthClick(Sender: TObject; Button: TUDBtnType);
begin
  Splitter1.Width := UpDownWidth.Position;
  Splitter2.Width := UpDownWidth.Position;
end;

procedure TForm1.OnListClick(Sender: TObject);
begin
  with FontDialog1 do
    if Execute then
      (Sender as TListBox).Font := Font;
end;

end.
