unit ListActForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolWin, ActnMan, ActnCtrls, StdCtrls, ActnList, ListActns,
  ActnMenus, ExtActns, DateUtils, XPStyleActnCtrls;

type
  TForm1 = class(TForm)
    ActionManager1: TActionManager;
    StaticListAction1: TStaticListAction;
    ListBox1: TListBox;
    ActionToolBar1: TActionToolBar;
    VirtualListAction1: TVirtualListAction;
    ListControlCopySelection1: TListControlCopySelection;
    ListControlDeleteSelection1: TListControlDeleteSelection;
    ActionToolBar2: TActionToolBar;
    ListControlMoveSelection2: TListControlMoveSelection;
    ListBox2: TListBox;
    procedure VirtualListAction1GetItemCount(Sender: TCustomListAction;
      var Count: Integer);
    procedure VirtualListAction1GetItem(Sender: TCustomListAction;
      const Index: Integer; var Value: String; var ImageIndex: Integer;
      var Data: Pointer);
    procedure ListActionItemSelected(Sender: TCustomListAction;
      Control: TControl);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.VirtualListAction1GetItemCount(Sender: TCustomListAction;
  var Count: Integer);
begin
  Count := 100;
end;

procedure TForm1.VirtualListAction1GetItem(Sender: TCustomListAction;
  const Index: Integer; var Value: String; var ImageIndex: Integer;
  var Data: Pointer);
begin
  Value := 'Item' + IntToStr (Index);
  // add this code to check when the method is called
  { + ' - ' + IntToStr (SecondOf (Now)) + ':' +
    IntToStr (MilliSecondOf (Now));}
end;

procedure TForm1.ListActionItemSelected(Sender: TCustomListAction;
  Control: TControl);
begin
  ListBox1.Items.Add ((Control as TCustomActionCombo).SelText);
end;

end.
