unit Frame;

interface

uses
  Windows, Classes, Graphics, Forms, Controls,
  Child, Menus, SysUtils, StdActns, ActnList, Dialogs, ImgList, ComCtrls,
  ToolWin;

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
    ActionList1: TActionList;
    ActionArrange: TWindowArrange;
    ActionCascade: TWindowCascade;
    ActionClose: TWindowClose;
    ActionMinimizeAll: TWindowMinimizeAll;
    ActionTileHorizontal: TWindowTileHorizontal;
    ActionTileVertical: TWindowTileVertical;
    Tile2: TMenuItem;
    Close1: TMenuItem;
    MinimizeAll1: TMenuItem;
    Edit1: TMenuItem;
    Cut1: TMenuItem;
    Copy1: TMenuItem;
    Paste1: TMenuItem;
    ActionCopy: TEditCopy;
    ActionCut: TEditCut;
    ActionPaste: TEditPaste;
    ActionFont: TAction;
    FontDialog1: TFontDialog;
    N2: TMenuItem;
    Font1: TMenuItem;
    ActionNew: TAction;
    ActionOpen: TAction;
    ActionSaveAs: TAction;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Open1: TMenuItem;
    Save1: TMenuItem;
    ActionSave: TAction;
    Save2: TMenuItem;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    procedure Exit1Click(Sender: TObject);
    procedure ActionFontExecute(Sender: TObject);
    procedure ActionFontUpdate(Sender: TObject);
    procedure ActionNewExecute(Sender: TObject);
    procedure ActionOpenExecute(Sender: TObject);
    procedure ActionSaveAsExecute(Sender: TObject);
    procedure ActionSaveAsUpdate(Sender: TObject);
    procedure ActionSaveUpdate(Sender: TObject);
    procedure ActionSaveExecute(Sender: TObject);
  private
    { Private declarations }
    Counter: Integer;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

procedure TMainForm.Exit1Click(Sender: TObject);
begin
  // automatically closes each child
  Close;
end;

procedure TMainForm.ActionFontExecute(Sender: TObject);
begin
  if FontDialog1.Execute then
    (ActiveMDIChild as TChildForm).Memo1.Font :=
      FontDialog1.Font;
end;

procedure TMainForm.ActionFontUpdate(Sender: TObject);
begin
  ActionFont.Enabled := MDIChildCount > 0;
end;

procedure TMainForm.ActionNewExecute(Sender: TObject);
var
  ChildForm: TChildForm;
begin
  Inc (Counter);
  ChildForm := TChildForm.Create (Self);
  ChildForm.Caption :=
    LowerCase (ExtractFilePath (Application.Exename)) +
    'text' + IntToStr (Counter) + '.txt';
  ChildForm.Show;
end;

procedure TMainForm.ActionOpenExecute(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    ActionNewExecute (Self);
    (ActiveMDIChild as TChildForm).Load (OpenDialog1.FileName);
  end;
end;

procedure TMainForm.ActionSaveAsExecute(Sender: TObject);
begin
  // suggest the current file name
  SaveDialog1.FileName := ActiveMDIChild.Caption;
  if SaveDialog1.Execute then
  begin
    // modify the file name and save
    ActiveMDIChild.Caption := SaveDialog1.FileName;
    (ActiveMDIChild as TChildForm).Save;
  end;
end;

procedure TMainForm.ActionSaveAsUpdate(Sender: TObject);
begin
  ActionSaveAs.Enabled := MDIChildCount > 0;
end;

procedure TMainForm.ActionSaveUpdate(Sender: TObject);
begin
  ActionSave.Enabled := (MDIChildCount > 0) and
    (ActiveMDIChild as TChildForm).Modified;
end;

procedure TMainForm.ActionSaveExecute(Sender: TObject);
begin
  (ActiveMDIChild as TChildForm).Save;
end;

end.

 