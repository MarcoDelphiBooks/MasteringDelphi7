unit AboutF;

interface

uses
  Qt, SysUtils, Classes, QGraphics, QControls, QForms, QDialogs,
  QStdCtrls, QButtons, QExtCtrls;

type
  TAboutBox = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    Image1: TImage;
    Label1: TLabel;
  private
    { Private declarations }
  public
    procedure MakeSplash;
  end;

var
  AboutBox: TAboutBox;

implementation

{$R *.xfm}

procedure TAboutBox.MakeSplash;
begin
  BorderStyle := fbsNone;
  BitBtn1.Visible := False;
  Panel1.BorderWidth := 3;
  Show;
  Update;
end;

end.
