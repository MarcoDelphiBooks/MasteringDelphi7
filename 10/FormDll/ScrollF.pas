unit ScrollF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ComCtrls, ExtCtrls, Buttons;

type
  TFormScroll = class(TForm)
    ScrollBarRed: TScrollBar;
    ScrollBarGreen: TScrollBar;
    ScrollBarBlue: TScrollBar;
    LabelRed: TLabel;
    LabelGreen: TLabel;
    LabelBlue: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Label1: TLabel;
    Label2: TLabel;
    LabelScroll: TLabel;
    TrackBar1: TTrackBar;
    Panel1: TPanel;
    sbRed: TSpeedButton;
    sbBlue: TSpeedButton;
    sbGreen: TSpeedButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    spApplication: TSpeedButton;
    procedure ScrollBarsScroll(Sender: TObject; ScrollCode: TScrollCode;
      var ScrollPos: Integer);
    procedure TrackBar1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure sbRedClick(Sender: TObject);
    procedure sbBlueClick(Sender: TObject);
    procedure sbGreenClick(Sender: TObject);
    procedure spApplicationClick(Sender: TObject);
  private
    FormHandle: THandle;
    MsgBack: Integer;
    procedure SetSelColor (Col: TColor);
    function GetSelColor: TColor;
  public
    procedure ApplyClick (Sender: TObject);
    property SelectedColor: TColor
      read GetSelColor write SetSelColor;
  end;

// extern DLL functions declarations
function GetColor (Col: LongInt): LongInt; stdcall;
procedure ShowColor (Col: LongInt;
  FormHandle: THandle; MsgBack: Integer); stdcall;
procedure SyncApp (AppHandle: THandle); stdcall;

implementation

{$R *.DFM}

procedure TFormScroll.ScrollBarsScroll(Sender: TObject;
  ScrollCode: TScrollCode; var ScrollPos: Integer);
begin
  (Sender as TScrollBar).Hint := IntToStr(ScrollPos);

  Shape1.Brush.Color := RGB (ScrollBarRed.Position,
    ScrollBarGreen.Position, ScrollBarBlue.Position);
  Shape2.Pen.Color := RGB (ScrollBarRed.Position,
    ScrollBarGreen.Position, ScrollBarBlue.Position);
end;

procedure TFormScroll.TrackBar1Change(Sender: TObject);
begin
  LabelScroll.Caption := 'Scroll by ' + IntToStr(TrackBar1.Position);
  ScrollBarGreen.LargeChange := TrackBar1.Position;
  ScrollBarRed.LargeChange := TrackBar1.Position;
  ScrollBarBlue.LargeChange := TrackBar1.Position;
end;

procedure TFormScroll.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // used by the modeless form
  Action := caFree;
end;

procedure TFormScroll.FormActivate(Sender: TObject);
begin
  // change buttons for modeless form
  if FormHandle <> 0 then
  begin
    BitBtn1.Caption := 'Apply';
    BitBtn1.OnClick := ApplyClick;
    BitBtn2.Kind := bkClose;
  end;
end;

procedure TFormScroll.ApplyClick(Sender: TObject);
begin
  // notify to the main form
  SendMessage (FormHandle, MsgBack, SelectedColor, 0);
end;

procedure TFormScroll.sbRedClick(Sender: TObject);
begin
  SelectedColor := clRed;
end;

// set and get properties

function TFormScroll.GetSelColor: TColor;
begin
  Result := RGB (ScrollBarRed.Position,
    ScrollBarGreen.Position, ScrollBarBlue.Position);
end;

procedure TFormScroll.SetSelColor (Col: TColor);
var
  RGBCol: Integer;
begin
  RGBCol := ColorToRGB (Col);
  ScrollBarRed.Position := GetRValue (RGBCol);
  ScrollBarGreen.Position := GetGValue (RGBCol);
  ScrollBarBlue.Position := GetBValue (RGBCol);
  Shape1.Brush.Color := Col;
  Shape2.Pen.Color := Col;
end;

procedure TFormScroll.sbBlueClick(Sender: TObject);
begin
  SelectedColor := clBlue;
end;

procedure TFormScroll.sbGreenClick(Sender: TObject);
begin
  SelectedColor := clGreen;
end;

procedure TFormScroll.spApplicationClick(Sender: TObject);
begin
  ShowMessage ('Application Handle: ' +
    IntToStr (Application.Handle));
end;

// extern DLL functions

function GetColor (Col: LongInt): LongInt; stdcall;
var
  FormScroll: TFormScroll;
begin
  // default value
  Result := Col;
  try
    FormScroll := TFormScroll.Create (Application);
    try
      // initialize the data
      FormScroll.SelectedColor := Col;
      // show the form
      if FormScroll.ShowModal = mrOK then
        Result := FormScroll.SelectedColor;
    finally
      FormScroll.Free;
    end;
  except
    on E: Exception do
      MessageDlg ('Error in FormDLL: ' +
        E.Message, mtError, [mbOK], 0);
  end;
end;

procedure ShowColor (Col: LongInt;
  FormHandle: THandle; MsgBack: Integer); stdcall;
var
  FormScroll: TFormScroll;
begin
  FormScroll := TFormScroll.Create (Application);
  try
    // initialize the data
    FormScroll.FormHandle := FormHandle;
    FormScroll.MsgBack := MsgBack;
    FormScroll.SelectedColor := Col;
    // show the form
    FormScroll.Show;
  except
    on E: Exception do
    begin
      MessageDlg ('Error in FormDLL: ' +
        E.Message, mtError, [mbOK], 0);
      FormScroll.Free;
    end;
  end;
end;

procedure SyncApp (AppHandle: THandle); stdcall;
begin
  Application.Handle := AppHandle;
end;

end.
