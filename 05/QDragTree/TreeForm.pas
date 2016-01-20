unit TreeForm;

interface

uses
  SysUtils, Qt, Classes, QGraphics, QControls, QForms, QDialogs,
  QStdCtrls, QComCtrls, QMenus, QTypes;

type
  TForm1 = class(TForm)
    TreeView1: TTreeView;
    MainMenu1: TMainMenu;
    Options1: TMenuItem;
    File1: TMenuItem;
    Exit1: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    Root1: TMenuItem;
    Buttons1: TMenuItem;
    Lines1: TMenuItem;
    N1: TMenuItem;
    Font1: TMenuItem;
    FontDialog1: TFontDialog;
    procedure FormCreate(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Root1Click(Sender: TObject);
    procedure Buttons1Click(Sender: TObject);
    procedure Lines1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure Font1Click(Sender: TObject);
    procedure TreeView1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure TreeView1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TreeView1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.xfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  TreeView1.LoadFromFile (
    ExtractFilePath (Application.ExeName) + 'TreeText.txt');
end;

procedure TForm1.About1Click(Sender: TObject);
begin
  MessageDlg ('DragTree Example'#13'by Marco Cantù',
    mtInformation, [mbOk], 0);
end;

procedure TForm1.Root1Click(Sender: TObject);
begin
{  TreeView1.ShowRoot := not TreeView1.ShowRoot;
  Root1.Checked := TreeView1.ShowRoot;}
end;

procedure TForm1.Buttons1Click(Sender: TObject);
begin
  TreeView1.ShowButtons := not TreeView1.ShowButtons;
  Buttons1.Checked := TreeView1.ShowButtons;
end;

procedure TForm1.Lines1Click(Sender: TObject);
begin
{  TreeView1.ShowLines := not TreeView1.ShowLines;
  Lines1.Checked := TreeView1.ShowLines;}
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.Font1Click(Sender: TObject);
begin
  if FontDialog1.Execute then
    TreeView1.Font := FontDialog1.Font;
end;

procedure TForm1.TreeView1DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
var
  TargetNode, SourceNode: TTreeNode;
begin
  TargetNode := TreeView1.GetNodeAt (X, Y);
  // accept dragging from itself
  if (Source = Sender) and (TargetNode <> nil) then
  begin
    Accept := True;
    // determines source and target
    SourceNode := TreeView1.Selected;
    // look up the target parent chain
    while (TargetNode.Parent <> nil) and
        (TargetNode <> SourceNode) do
      TargetNode := TargetNode.Parent;
    // if source is found
    if TargetNode = SourceNode then
      // do not allow dragging over a child
      Accept := False;
  end
  else
    Accept := False;
end;

procedure TForm1.TreeView1DragDrop(Sender, Source: TObject;
  X, Y: Integer);
var
  TargetNode, SourceNode: TTreeNode;
begin
  TargetNode := TreeView1.GetNodeAt (X, Y);
  if TargetNode <> nil then
  begin
    SourceNode := TreeView1.Selected;
    SourceNode.MoveTo (TargetNode, naAddChildFirst);
    TargetNode.Expand (False);
    TreeView1.Selected := TargetNode;
  end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TreeView1.SaveToFile (
    ExtractFilePath (Application.ExeName) + 'TreeText.txt');
end;

procedure TForm1.TreeView1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TreeView1.BeginDrag (False); 
end;

end.
