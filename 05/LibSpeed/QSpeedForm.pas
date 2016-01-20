unit QSpeedForm;

interface

uses
  SysUtils, Classes, Types, QGraphics, QControls, QForms,
  QDialogs, QStdCtrls;

type
  TForm1 = class(TForm)
    ScrollBox1: TScrollBox;
    Button1: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.xfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  i: Integer;
  time: TDateTime;
begin
  time := Now;
  for I := 0 to 500 do
  begin
    with TEdit.Create (self) do
    begin
      SetBounds (Random (ScrollBox1.ClientWidth),
        Random (ScrollBox1.ClientHeight),
        50, 16);
      Parent := ScrollBox1;
      Text := 'Edit ' + IntToStr (I);
    end;
    with TButton.Create (self) do
    begin
      SetBounds (Random (ScrollBox1.ClientWidth),
        Random (ScrollBox1.ClientHeight),
        Width, Height); // default
      Parent := ScrollBox1;
      Caption := 'Button ' + IntToStr (I);
    end;
    Application.ProcessMessages;
  end;
  time := Now - time;
  Label1.Caption := FormatDateTime ('nn:ss.zzz', time);
end;

end.
