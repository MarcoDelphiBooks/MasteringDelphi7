unit RichForm;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls, Menus, ActnList, ToolWin, ImgList, ClipBrd,
  RichEdit, AppEvnts;

type
  TFormRichNote = class(TForm)
    RichEdit: TRichEdit;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    ToolBar1: TToolBar;
    tbtnNew: TToolButton;
    tbtnOpen: TToolButton;
    tbtnSave: TToolButton;
    tbtnPrint: TToolButton;
    ToolButton5: TToolButton;
    tbtnUndo: TToolButton;
    tbtnCut: TToolButton;
    tbtnCopy: TToolButton;
    tbtnPaste: TToolButton;
    tbtnBold: TToolButton;
    tbtnItalic: TToolButton;
    ToolButton13: TToolButton;
    ToolButton21: TToolButton;
    Images: TImageList;
    tbtnSize: TToolButton;
    ComboFont: TComboBox;
    SizeMenu: TPopupMenu;
    Small1: TMenuItem;
    Medium1: TMenuItem;
    Large1: TMenuItem;
    ColorBox1: TColorBox;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ApplicationEvents1: TApplicationEvents;
    StatusBar: TStatusBar;
    procedure BoldExecute(Sender: TObject);
    procedure ItalicExecute(Sender: TObject);
    procedure OpenExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure NewExecute(Sender: TObject);
    procedure SaveExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure PrintExecute(Sender: TObject);
    procedure RichEditChange(Sender: TObject);
    procedure CutExecute(Sender: TObject);
    procedure CopyExecute(Sender: TObject);
    procedure PasteExecute(Sender: TObject);
    procedure UndoExecute(Sender: TObject);
    procedure tbtnSizeClick(Sender: TObject);
    procedure SetFontSize(Sender: TObject);
    procedure ComboFontClick(Sender: TObject);
    procedure RichEditSelectionChange(Sender: TObject);
    procedure ColorBox1Change(Sender: TObject);
    procedure ApplicationEvents1Idle(Sender: TObject; var Done: Boolean);
    procedure ApplicationEvents1Hint(Sender: TObject);
  private
    FModified: Boolean;
    FileName: string;
    procedure SetModified(const Value: Boolean);
    property Modified: Boolean read FModified write SetModified;
    procedure CheckCapslock;
  public
    function SaveChanges: Boolean;
    function Save: Boolean;
    function SaveAs: Boolean;
  end;

var
  FormRichNote: TFormRichNote;

implementation

{$R *.DFM}

// status bar panels
const
  sbpMessage = 0;
  sbpCaps = 1;
  sbpPosition = 2;

/////////// Font operations

procedure TFormRichNote.BoldExecute(Sender: TObject);
begin
  with RichEdit.SelAttributes do
    if fsBold in Style then
      Style := Style - [fsBold]
    else
      Style := Style + [fsBold];
end;

procedure TFormRichNote.ItalicExecute(Sender: TObject);
begin
  with RichEdit.SelAttributes do
    if fsItalic in Style then
      Style := Style - [fsItalic]
    else
      Style := Style + [fsItalic];
end;

procedure TFormRichNote.tbtnSizeClick(Sender: TObject);
begin
  RichEdit.SelAttributes.Size :=
    RichEdit.SelAttributes.Size + 2;
end;

procedure TFormRichNote.SetFontSize(Sender: TObject);
begin
  RichEdit.SelAttributes.Size :=
    (Sender as TMenuItem).Tag;
end;

procedure TFormRichNote.ComboFontClick(Sender: TObject);
begin
  RichEdit.SelAttributes.Name := ComboFont.Text;
end;

procedure TFormRichNote.ColorBox1Change(Sender: TObject);
begin
  RichEdit.SelAttributes.Color := ColorBox1.Selected;
end;

/////////// File operations

procedure TFormRichNote.NewExecute(Sender: TObject);
begin
  if not Modified or SaveChanges then
  begin
    RichEdit.Text := '';
    Modified := False;
    FileName := '';
    Caption := Application.Title + ' - [Untitled]';
  end;
end;

procedure TFormRichNote.OpenExecute(Sender: TObject);
begin
  if not Modified or SaveChanges then
    if OpenDialog.Execute then
    begin
      Filename := OpenDialog.FileName;
      RichEdit.Lines.LoadFromFile (FileName);
      Modified := False;
      Caption := Application.Title + ' - ' + FileName;
      RichEdit.ReadOnly := ofReadOnly in
        OpenDialog.Options;
    end;
end;

// return False to skip current operation
function TFormRichNote.SaveChanges: Boolean;
begin
  case MessageDlg (
    'The document ' + filename + ' has changed.' +
    #13#13 + 'Do you want to save the changes?',
    mtConfirmation, mbYesNoCancel, 0) of
  idYes:
    // call Save and return its result
    Result := Save;
  idNo:
    // do not save and continue
    Result := True;
  else // idCancel:
    // do not save and abort operation
    Result := False;
  end;
end;

// return False means the SaveAs has been aborted
function TFormRichNote.Save: Boolean;
begin
  if Filename = '' then
    Result := SaveAs // ask for a file name
  else
  begin
    RichEdit.Lines.SaveToFile (FileName);
    Modified := False;
    Result := True;
  end;
end;

// return False if SaveAs dialog box is cancelled
function TFormRichNote.SaveAs: Boolean;
begin
  SaveDialog.FileName := Filename;
  if SaveDialog.Execute then
  begin
    Filename := SaveDialog.FileName;
    Save;
    Caption := Application.Title  + ' - ' + Filename;
    Result := True;
  end
  else
    Result := False;
end;

procedure TFormRichNote.SaveExecute(Sender: TObject);
begin
  if Modified then
    Save;
end;

procedure TFormRichNote.PrintExecute(Sender: TObject);
begin
  RichEdit.Print (FileName);
end;

/////////// Form events

procedure TFormRichNote.FormCreate(Sender: TObject);
begin
  Application.Title := Caption;
  NewExecute (Self);

  // initialize font selection
  ComboFont.Items := Screen.Fonts;
  ComboFont.ItemIndex := ComboFont.Items.IndexOf (
    RichEdit.Font.Name);
end;

procedure TFormRichNote.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  // short-circuit evaluation: if not modified
  // doesn't even try to save. Doesn't close if
  // save request is cancelled
  CanClose := not Modified or SaveChanges;
end;

// copy and paste operations

procedure TFormRichNote.CutExecute(Sender: TObject);
begin
  RichEdit.CutToClipboard;
end;

procedure TFormRichNote.CopyExecute(Sender: TObject);
begin
  RichEdit.CopyToClipboard;
end;

procedure TFormRichNote.PasteExecute(Sender: TObject);
begin
  RichEdit.PasteFromClipboard;
end;

procedure TFormRichNote.UndoExecute(Sender: TObject);
begin
  RichEdit.Undo;
end;

// richedit events

procedure TFormRichNote.RichEditChange(Sender: TObject);
begin
  // enables save operations
  Modified := True;
end;

procedure TFormRichNote.RichEditSelectionChange(Sender: TObject);
begin
  tbtnBold.Down := fsBold in RichEdit.SelAttributes.Style;
  tbtnItalic.Down := fsItalic in RichEdit.SelAttributes.Style;
  tbtnCut.Enabled := RichEdit.SelLength > 0;
  tbtnCopy.Enabled := tbtnCut.Enabled;

  // select current font and color
  ComboFont.ItemIndex :=
    ComboFont.Items.IndexOf (RichEdit.SelAttributes.Name);
  ColorBox1.Selected := RichEdit.SelAttributes.Color;

  // update the position in the status bar
  StatusBar.Panels[sbpPosition].Text := Format ('%d/%d',
    [RichEdit.CaretPos.Y + 1, RichEdit.CaretPos.X + 1]);
end;

// events/methods udpating toolbar buttons

procedure TFormRichNote.SetModified(const Value: Boolean);
begin
  FModified := Value;
  tbtnSave.Enabled := Modified;
end;

procedure TFormRichNote.ApplicationEvents1Idle(Sender: TObject;
  var Done: Boolean);
begin
  // update toolbar buttons
  tbtnPaste.Enabled := RichEdit.Perform (em_CanPaste, 0, 0) <> 0;
  CheckCapslock;
end;

procedure TFormRichNote.CheckCapslock;
begin
  // show status in caps panel
  if Odd (GetKeyState (VK_CAPITAL)) then
    StatusBar.Panels[sbpCaps].Text := 'CAPS'
  else
    StatusBar.Panels[sbpCaps].Text := '';
end;

procedure TFormRichNote.ApplicationEvents1Hint(Sender: TObject);
begin
  // show hint in the status bar message panel
  StatusBar.Panels[sbpMessage].Text := Application.Hint;
end;

end.
