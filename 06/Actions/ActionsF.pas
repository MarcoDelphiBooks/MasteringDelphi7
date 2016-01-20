unit ActionsF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdActns, ActnList, ExtCtrls, StdCtrls, Menus, ImgList, Buttons,
  ComCtrls, ToolWin;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    ActionList1: TActionList;
    ActionCopy: TEditCopy;
    ActionCut: TEditCut;
    ActionPaste: TEditPaste;
    ActionNew: TAction;
    ActionExit: TAction;
    NoAction: TAction;
    ActionCount: TAction;
    ActionBold: TAction;
    MainMenu1: TMainMenu;
    Edit1: TMenuItem;
    Paste2: TMenuItem;
    Copy2: TMenuItem;
    Cut2: TMenuItem;
    File1: TMenuItem;
    New1: TMenuItem;
    Close1: TMenuItem;
    Test1: TMenuItem;
    N1: TMenuItem;
    Bold1: TMenuItem;
    NoAction1: TMenuItem;
    CharCount1: TMenuItem;
    ImageList1: TImageList;
    ActionEnable: TAction;
    EnableNoAction1: TMenuItem;
    ActionSender: TAction;
    TestSender: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton2: TToolButton;
    procedure ActionNewExecute(Sender: TObject);
    procedure ActionExitExecute(Sender: TObject);
    procedure ActionBoldExecute(Sender: TObject);
    procedure ActionCountUpdate(Sender: TObject);
    procedure ActionCountExecute(Sender: TObject);
    procedure ActionEnableExecute(Sender: TObject);
    procedure ActionSenderExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.ActionNewExecute(Sender: TObject);
begin
  Memo1.Lines.Clear;
end;

procedure TForm1.ActionExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TForm1.ActionBoldExecute(Sender: TObject);
begin
  with Memo1.Font do
    if fsBold in Style then
      Style := Style - [fsBold]
    else
      Style := Style + [fsBold];
  // toggle status: provided by the AutoCheck property
  // ActionBold.Checked := not ActionBold.Checked;
end;

procedure TForm1.ActionCountUpdate(Sender: TObject);
begin
  ActionCount.Enabled := Memo1.Text <> '';
end;

procedure TForm1.ActionCountExecute(Sender: TObject);
begin
  ShowMessage ('Characters: ' + IntToStr (
    Length (Memo1.Text)));
end;

procedure TForm1.ActionEnableExecute(Sender: TObject);
begin
  NoAction.DisableIfNoHandler := False;
  NoAction.Enabled := True;
  ActionEnable.Enabled := False;
end;

procedure TForm1.ActionSenderExecute(Sender: TObject);
begin
  Memo1.Lines.Add (
    'Sender class: ' + Sender.ClassName);
  Memo1.Lines.Add (
    'Sender name: ' + (Sender as TComponent).Name);
  Memo1.Lines.Add (
    'Category: ' + (Sender as TAction).Category);
  Memo1.Lines.Add (
    'Action list name: ' + (Sender as TAction).ActionList.Name );
end;

end.
