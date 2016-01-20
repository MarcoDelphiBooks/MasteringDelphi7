unit Frame;

interface

uses
  Windows, Graphics, Forms, Classes, Messages,
  Controls, Child, Child2, Menus, SysUtils, Dialogs,
  ExtCtrls, StdActns, ActnList;

type
  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
    Window1: TMenuItem;
    New1: TMenuItem;
    File1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    Cascade1: TMenuItem;
    Tile1: TMenuItem;
    ArrangeIcons1: TMenuItem;
    New2: TMenuItem;
    Tile2: TMenuItem;
    CloseAll1: TMenuItem;
    Count1: TMenuItem;
    Image1: TImage;
    ActionList1: TActionList;
    WindowArrange1: TWindowArrange;
    WindowCascade1: TWindowCascade;
    WindowClose1: TWindowClose;
    WindowMinimizeAll1: TWindowMinimizeAll;
    WindowTileHorizontal1: TWindowTileHorizontal;
    WindowTileVertical1: TWindowTileVertical;
    Close1: TMenuItem;
    MinimizeAll1: TMenuItem;
    N2: TMenuItem;
    procedure New1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure New2Click(Sender: TObject);
    procedure CloseAll1Click(Sender: TObject);
    procedure Count1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    Count: Integer;
    OutCanvas: TCanvas;
    OldWinProc, NewWinProc: Pointer;
    procedure NewWinProcedure (var Msg: TMessage);
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

procedure TMainForm.New1Click(Sender: TObject);
var
  ChildForm: TCircleChildForm;
begin
  Inc (Count);
  ChildForm := TCircleChildForm.Create (Self);
  ChildForm.Caption := ChildForm.Caption + ' ' +
    IntToStr (Count);
  ChildForm.Show;
end;

procedure TMainForm.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.New2Click(Sender: TObject);
var
  ChildForm: TBounceChildForm;
begin
  Inc (Count);
  ChildForm := TBounceChildForm.Create (Self);
  ChildForm.Caption := ChildForm.Caption + ' ' +
    IntToStr (Count);
  ChildForm.Show;
end;

procedure TMainForm.CloseAll1Click(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to MDIChildCount - 1 do
    MDIChildren [I].Close;
end;

procedure TMainForm.Count1Click(Sender: TObject);
var
  NBounce, NCircle, I: Integer;
begin
  NBounce := 0;
  NCircle := 0;
  for I := 0 to MDIChildCount - 1 do
    if MDIChildren [I] is TBounceChildForm then
      Inc (NBounce)
    else
      Inc (NCircle);
  MessageDlg (
    Format ('There are %d child forms.'#13 +
      '%d are Circle child windows and ' +
      '%d are Bouncing child windows',
      [MDIChildCount, NCircle, NBounce]),
    mtINformation, [mbOk], 0);
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  NewWinProc := MakeObjectInstance (NewWinProcedure);
  OldWinProc := Pointer (SetWindowLong (
    ClientHandle, gwl_WndProc, Cardinal (NewWinProc)));
  OutCanvas := TCanvas.Create;
end;

procedure TMainForm.NewWinProcedure (var Msg: TMessage);
var
  BmpWidth, BmpHeight: Integer;
  I, J: Integer;
begin
  // default processing first
  Msg.Result := CallWindowProc (OldWinProc,
    ClientHandle, Msg.Msg, Msg.wParam, Msg.lParam);

  // handle background repaint
  if Msg.Msg = wm_EraseBkgnd then
  begin
    BmpWidth := MainForm.Image1.Width;
    BmpHeight := MainForm.Image1.Height;
    if (BmpWidth <> 0) and (BmpHeight <> 0) then
    begin
      OutCanvas.Handle := Msg.wParam;
      for I := 0 to MainForm.ClientWidth div BmpWidth do
        for J := 0 to MainForm.ClientHeight div BmpHeight do
          OutCanvas.Draw (I * BmpWidth,
            J * BmpHeight, MainForm.Image1.Picture.Graphic);
    end;
  end;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  OutCanvas.Free;
end;

end.

