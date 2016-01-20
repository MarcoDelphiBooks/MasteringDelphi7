unit AboutF;

interface

uses
  Qt, SysUtils, Classes, QGraphics, QControls, QForms, QDialogs,
  QStdCtrls, QButtons, QExtCtrls, QTypes;

type
  TAboutBox = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    Image1: TImage;
    Label1: TLabel;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
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
  FormStyle := fsStayOnTop;
  BitBtn1.Visible := False;
  Panel1.BorderWidth := 3;
  Show;
  Update;
end;

procedure TAboutBox.Timer1Timer(Sender: TObject);
begin
  Close;
  Release;
end;

end.
