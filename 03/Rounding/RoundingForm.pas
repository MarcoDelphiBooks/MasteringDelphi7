unit RoundingForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Math, StdCtrls;

type
  TForm1 = class(TForm)
    btnClassic: TButton;
    ListBox1: TListBox;
    btnSimpleRound: TButton;
    btnTroubles: TButton;
    procedure btnClassicClick(Sender: TObject);
    procedure btnSimpleRoundClick(Sender: TObject);
    procedure btnTroublesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnClassicClick(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to 10 do
    ListBox1.Items.Add (FloatToStr (i + 0.5) + ' -> ' +
      IntToStr (Round (i + 0.5)));
end;

procedure TForm1.btnSimpleRoundClick(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to 10 do
    ListBox1.Items.Add (FloatToStr (i + 0.5) + ' -> ' +
      FloatToStr (SimpleRoundTo (i + 0.5, 0)));
end;

procedure TForm1.btnTroublesClick(Sender: TObject);
var
  d: double;
  i: Integer;
begin
  // this is not as expected...
  for i := 0 to 10 do
  begin
    d := 1 + i/10 + 0.05;
    ListBox1.Items.Add (FloatToStr (d) + ' -> ' +
      FloatToStr (SimpleRoundTo (d, -1)));
  end;

  // this seems to work...
  for i := 0 to 10 do
  begin
    d := 1 + i/10 + 0.05;
    ListBox1.Items.Add (FloatToStr (d) + ' -> ' +
      FloatToStr (SimpleRoundTo (d * 10, 0) / 10));
  end;
end;

end.
