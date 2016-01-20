unit IWTreeForm;
{PUBDIST}

interface

uses
  IWAppForm, IWApplication, IWTypes, Menus, IWCompMenu, Classes, Controls,
  IWControl, IWTreeview;

type
  TformTree = class(TIWAppForm)
    IWTreeView1: TIWTreeView;
    IWMenu1: TIWMenu;
    MainMenu1: TMainMenu;
    Tree1: TMenuItem;
    ExpandAll1: TMenuItem;
    CollapseAll1: TMenuItem;
    EnlargeFont1: TMenuItem;
    About1: TMenuItem;
    Application1: TMenuItem;
    TreeContents1: TMenuItem;
    N1: TMenuItem;
    ReduceFont1: TMenuItem;
    procedure ExpandAll1Click(Sender: TObject);
    procedure CollapseAll1Click(Sender: TObject);
    procedure EnlargeFont1Click(Sender: TObject);
    procedure ReduceFont1Click(Sender: TObject);
    procedure Application1Click(Sender: TObject);
    procedure TreeContents1Click(Sender: TObject);
  public
  end;

implementation
{$R *.dfm}

uses
  ServerController, Windows, IWForm, IWCompMemo, SysUtils;

procedure TformTree.ExpandAll1Click(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to IWTreeView1.Items.Count - 1 do
    IWTreeView1.Items [i].Expanded := True;
end;

procedure TformTree.CollapseAll1Click(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to IWTreeView1.Items.Count - 1 do
    IWTreeView1.Items [i].Expanded := False;
end;

procedure TformTree.EnlargeFont1Click(Sender: TObject);
begin
  IWTreeView1.Font.Size := IWTreeView1.Font.Size + 2;
end;

procedure TformTree.ReduceFont1Click(Sender: TObject);
begin
  IWTreeView1.Font.Size := IWTreeView1.Font.Size - 2;
end;

procedure TformTree.Application1Click(Sender: TObject);
begin
  WebApplication.ShowMessage(WebApplication.AppID);
end;

procedure TformTree.TreeContents1Click(Sender: TObject);
var
  i: Integer;
begin
  with TIWMemo.Create(self) do
  begin
    Parent := self;
    Align := alBottom;
    for i := 0 to IWTreeView1.Items.Count - 1 do
      Lines.Add (IWTreeView1.Items [i].Caption + ' (' +
        IntToStr (IWTreeView1.Items [i].SubItems.Count) + ')');
  end;
end;

end.