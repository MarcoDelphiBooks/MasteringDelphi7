unit OleForm;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Menus, ExtCtrls, StdCtrls, OleCtnrs, Buttons;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Exit1: TMenuItem;
    N2: TMenuItem;
    SaveAs1: TMenuItem;
    Open1: TMenuItem;
    New1: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    Edit1: TMenuItem;
    Object1: TMenuItem;
    N3: TMenuItem;
    PasteSpecial1: TMenuItem;
    Paste1: TMenuItem;
    Copy1: TMenuItem;
    Cut1: TMenuItem;
    ToolbarPanel: TPanel;
    NewSpeedButton: TSpeedButton;
    CutSpeedButton: TSpeedButton;
    CopySpeedButton: TSpeedButton;
    PasteSpeedButton: TSpeedButton;
    AboutSpeedButton: TSpeedButton;
    MainPanel: TPanel;
    OleContainer1: TOleContainer;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure Exit1Click(Sender: TObject);
    procedure New1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Paste1Click(Sender: TObject);
    procedure PasteSpecial1Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Copy1Click(Sender: TObject);
    procedure Cut1Click(Sender: TObject);
    procedure Object1Click(Sender: TObject);
    procedure Open1Click(Sender: TObject);
    procedure SaveAs1Click(Sender: TObject);
  private
    { Private declarations }
    procedure UpdateUI;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.New1Click(Sender: TObject);
begin
  if OleContainer1.InsertObjectDialog then
    OleContainer1.DoVerb (
      OleContainer1.PrimaryVerb);
  UpdateUI;
end;

procedure TForm1.About1Click(Sender: TObject);
begin
  MessageDlg ('Sample OLE container' +
    #13'From the book "Mastering Delphi"',
    mtInformation, [mbOk], 0);
end;

procedure TForm1.Paste1Click(Sender: TObject);
begin
  OleContainer1.Paste;
  UpdateUI;
end;

procedure TForm1.PasteSpecial1Click(Sender: TObject);
begin
  OleContainer1.PasteSpecialDialog;
  UpdateUI;
end;

procedure TForm1.Edit1Click(Sender: TObject);
begin
  UpdateUI;
end;

procedure TForm1.UpdateUI;
begin
  Cut1.Enabled := OleContainer1.State <> osEmpty;
  Copy1.Enabled := OleContainer1.State <> osEmpty;
  Object1.Enabled := OleContainer1.State <> osEmpty;
  Paste1.Enabled := OleContainer1.CanPaste;
  PasteSpecial1.Enabled := OleContainer1.CanPaste;
  PasteSpeedButton.Enabled := Paste1.Enabled;
  CutSpeedButton.Enabled := Cut1.Enabled;
  CopySpeedButton.Enabled := Copy1.Enabled;
end;

procedure TForm1.Copy1Click(Sender: TObject);
begin
  OleContainer1.Copy;
  UpdateUI;
end;

procedure TForm1.Cut1Click(Sender: TObject);
begin
  OleContainer1.Copy;
  OleContainer1.Destroy;
  UpdateUI;
end;

procedure TForm1.Object1Click(Sender: TObject);
begin
  OleContainer1.ObjectPropertiesDialog;
end;

procedure TForm1.Open1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
    OleContainer1.LoadFromFile (OpenDialog1.FileName);
  UpdateUI;
end;

procedure TForm1.SaveAs1Click(Sender: TObject);
begin
  if SaveDialog1.Execute then
    OleContainer1.SaveToFile (SaveDialog1.FileName);
end;


end.
