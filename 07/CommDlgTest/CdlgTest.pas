unit Cdlgtest;

interface

uses
  Windows, Classes, Graphics, Forms, Controls,
  Menus, StdCtrls, Dialogs;

type
  TCommDlgForm = class(TForm)
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    FontDialog1: TFontDialog;
    ColorDialog1: TColorDialog;
    MainMenu1: TMainMenu;
    Memo1: TMemo;
    Open1: TMenuItem;
    TextFiles1: TMenuItem;
    Anynewfile1: TMenuItem;
    MultipleSelection1: TMenuItem;
    Save1: TMenuItem;
    TextFile1: TMenuItem;
    AnyFile1: TMenuItem;
    Font1: TMenuItem;
    OnlyTrueType1: TMenuItem;
    NoEffects1: TMenuItem;
    NoStyle1: TMenuItem;
    Apply1: TMenuItem;
    Color1: TMenuItem;
    Standard1: TMenuItem;
    FullOpen1: TMenuItem;
    NoFullOpen1: TMenuItem;
    Help1: TMenuItem;
    AboutCommonDialogsTest1: TMenuItem;
    PrinterSetupDialog1: TPrinterSetupDialog;
    FindDialog1: TFindDialog;
    ReplaceDialog1: TReplaceDialog;
    Print1: TMenuItem;
    Print2: TMenuItem;
    PrinterSetup1: TMenuItem;
    Search1: TMenuItem;
    Search2: TMenuItem;
    Replace1: TMenuItem;
    PrintDialog1: TPrintDialog;
    procedure TextFiles1Click(Sender: TObject);
    procedure Anynewfile1Click(Sender: TObject);
    procedure MultipleSelection1Click(Sender: TObject);
    procedure TextFile1Click(Sender: TObject);
    procedure AnyFile1Click(Sender: TObject);
    procedure OnlyTrueType1Click(Sender: TObject);
    procedure NoEffects1Click(Sender: TObject);
    procedure NoStyle1Click(Sender: TObject);
    procedure Apply1Click(Sender: TObject);
    procedure Standard1Click(Sender: TObject);
    procedure FullOpen1Click(Sender: TObject);
    procedure NoFullOpen1Click(Sender: TObject);
    procedure AboutCommonDialogsTest1Click(Sender: TObject);
    procedure Print2Click(Sender: TObject);
    procedure PrinterSetup1Click(Sender: TObject);
    procedure Search2Click(Sender: TObject);
    procedure Replace1Click(Sender: TObject);
    procedure FindDialog1Find(Sender: TObject);
    procedure ReplaceDialog1Replace(Sender: TObject);
    procedure ReplaceDialog1Find(Sender: TObject);
    procedure FontDialogApply(Sender: TObject; Wnd: HWND);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CommDlgForm: TCommDlgForm;

implementation

{$R *.DFM}

procedure TCommDlgForm.TextFiles1Click(Sender: TObject);
begin
  with OpenDialog1 do
  begin
    Filter := 'Text File (*.txt)|*.txt';
    DefaultExt := 'txt';
    Filename := '';
    Options := [ofHideReadOnly, ofFileMustExist,
      ofPathMustExist];
    if Execute then
      if ofExtensionDifferent in Options then
        MessageDlg ('Not a file with the .TXT extension',
          mtError, [mbOK], 0)
      else
        Memo1.Lines.LoadFromFile (FileName);
  end;
end;

procedure TCommDlgForm.Anynewfile1Click(Sender: TObject);
begin
  with OpenDialog1 do
  begin
    Filter := 'Any File (*.*)|*.*';
    FileName := '';
    Options := [];
    if Execute then
      Memo1.Lines.LoadFromFile (FileName);
  end;
end;

procedure TCommDlgForm.MultipleSelection1Click(Sender: TObject);
var
  i: Integer;
begin
  with OpenDialog1 do
  begin
    Filter := 'Text File (*.txt)|*.txt|Any File (*.*)|*.*';
    Filename := '';
    Options := [ofAllowMultiSelect, ofPathMustExist, ofCreatePrompt];
    if Execute then
      for i := 0 to Files.Count - 1 do
        if MessageDlg ('Open file ' + Files.Strings [i] + '?',
            mtConfirmation, [mbYes, mbNo], 0) = IDYES then
          Memo1.Lines.LoadFromFile (Files.Strings [i]);
    end;
end;

procedure TCommDlgForm.TextFile1Click(Sender: TObject);
begin
  with SaveDialog1 do
  begin
    Filter := 'Text File (*.txt)|*.txt';
    DefaultExt := 'txt';
    Filename := '';
    Options := [ofHideReadOnly, ofPathMustExist];
    if Execute then
      if ofExtensionDifferent in Options then
        MessageDlg ('Not a txt extension', mtError, [mbOK], 0)
      else
        Memo1.Lines.SaveToFile (FileName);
  end;
end;

procedure TCommDlgForm.AnyFile1Click(Sender: TObject);
begin
  with SaveDialog1 do
  begin
    Filter := 'Any File (*.*)|*.*';
    Filename := '';
    Options := [ofPathMustExist];
    if Execute then
      Memo1.Lines.SaveToFile (FileName);
  end;
end;

procedure TCommDlgForm.OnlyTrueType1Click(Sender: TObject);
begin
  with FontDialog1 do
  begin
    Options := [fdEffects, fdTrueTypeOnly, fdForceFontExist];
    if Execute then
      Memo1.Font := Font;
  end;
end;

procedure TCommDlgForm.NoEffects1Click(Sender: TObject);
begin
  with FontDialog1 do
  begin
    Options := [fdForceFontExist];
    if Execute then
      Memo1.Font := Font;
  end;
end;

procedure TCommDlgForm.NoStyle1Click(Sender: TObject);
begin
  with FontDialog1 do
  begin
    Options := [fdEffects, fdNoOEMFonts, fdNoStyleSel,
        fdNoSizeSel, fdForceFontExist];
    if Execute then
      Memo1.Font := Font;
  end;
end;

procedure TCommDlgForm.Apply1Click(Sender: TObject);
begin
  with FontDialog1 do
  begin
    OnApply := FontDialogApply;
    Options := [fdEffects, fdForceFontExist];
    Execute;
    OnApply := nil;
  end;
end;

procedure TCommDlgForm.Standard1Click(Sender: TObject);
begin
  with ColorDialog1 do
  begin
    Options := [];
    if Execute then
      Memo1.Color := Color;
  end;
end;

procedure TCommDlgForm.FullOpen1Click(Sender: TObject);
begin
  with ColorDialog1 do
  begin
    Options := [cdFullOpen];
    if Execute then
      Memo1.Color := Color;
  end;
end;

procedure TCommDlgForm.NoFullOpen1Click(Sender: TObject);
begin
  with ColorDialog1 do
  begin
    Options := [cdPreventFullOpen];
    if Execute then
      Memo1.Color := Color;
  end;
end;

procedure TCommDlgForm.AboutCommonDialogsTest1Click(Sender: TObject);
begin
  MessageDlg ('The ''Common Dialogs Test'' application has been written' +
    Chr(13) + 'for the book "Mastering Delphi" by Marco Cantù',
    mtInformation, [mbOk], 0);
end;

procedure TCommDlgForm.Print2Click(Sender: TObject);
begin
  PrintDialog1.Execute;
end;

procedure TCommDlgForm.PrinterSetup1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TCommDlgForm.Search2Click(Sender: TObject);
begin
  FindDialog1.Execute;
end;

procedure TCommDlgForm.Replace1Click(Sender: TObject);
begin
  ReplaceDialog1.Execute;
end;

procedure TCommDlgForm.FindDialog1Find(Sender: TObject);
var
  FoundPos, InitPos: Integer;
begin
  {search in the text after the current selection}
  InitPos := Memo1.SelStart + Memo1.SelLength;
  FoundPos := Pos (FindDialog1.FindText,
    Copy (Memo1.Text, InitPos + 1,
      Length (Memo1.Text) - InitPos));
  if FoundPos > 0 then
  begin
    {activate the component, and select the text}
    Memo1.SetFocus;
    Memo1.SelStart := InitPos + FoundPos - 1;
    Memo1.SelLength := Length(FindDialog1.FindText);
  end
  else
  begin
    MessageDlg ('Text not found', mtInformation, [mbOK], 0);
  end;
end;

procedure TCommDlgForm.ReplaceDialog1Replace(Sender: TObject);
var
  FoundPos, InitPos: Integer;
begin
  {search in the text after the current selection}
  InitPos := Memo1.SelStart + Memo1.SelLength;
  FoundPos := Pos (ReplaceDialog1.FindText,
    Copy (Memo1.Text, InitPos + 1,
      Length (Memo1.Text) - InitPos));
  if FoundPos > 0 then
  begin
    {activate the component, and select the text}
    Memo1.SetFocus;
    Memo1.SelStart := InitPos + FoundPos - 1;
    Memo1.SelLength := Length (ReplaceDialog1.FindText);
    Memo1.SelText := ReplaceDialog1.ReplaceText;
  end
  else
  begin
    MessageDlg ('Text not found', mtInformation, [mbOK], 0);
  end;
end;

procedure TCommDlgForm.ReplaceDialog1Find(Sender: TObject);
begin
  FindDialog1.FindText := ReplaceDialog1.FindText;
  FindDialog1Find (ReplaceDialog1);
end;

procedure TCommDlgForm.FontDialogApply(Sender: TObject; Wnd: HWND);
begin
  Memo1.Font := FontDialog1.Font;
end;

end.

