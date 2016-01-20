unit CustNodesForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    TreeView1: TTreeView;
    Button1: TButton;
    Label1: TLabel;
    procedure TreeView1CreateNodeClass(Sender: TCustomTreeView;
      var NodeClass: TTreeNodeClass);
    procedure Button1Click(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);
  private
    CurrentNodeClass: TTreeNodeClass;
  public
    procedure AddChildNodes(BaseNode: TTreeNode; nItems: Integer);
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

type
  TMyNode = class (TTreeNode)
  private
    FExtraCode: Integer;
  protected
    procedure SetExtraCode(const Value: Integer); virtual;
    function GetExtraCode: Integer; virtual;
  public
    property ExtraCode: Integer read
      GetExtraCode write SetExtraCode;
  end;

  TMySubNode = class (TMyNode)
  protected
    function GetExtraCode: Integer; override;
  end;

procedure TForm1.TreeView1CreateNodeClass(Sender: TCustomTreeView;
  var NodeClass: TTreeNodeClass);
begin
  NodeClass := CurrentNodeClass;
end;

{ TMyNode }

function TMyNode.GetExtraCode: Integer;
begin
  Result := FExtraCode;
end;

procedure TMyNode.SetExtraCode(const Value: Integer);
begin
  FExtraCode := Value;
end;

procedure TForm1.AddChildNodes (BaseNode: TTreeNode; nItems: Integer);
var
  MyNode: TMyNode;
  j: Integer;
begin
  for j := 1 to nItems do
  begin
    CurrentNodeClass := TMySubNode;
    MyNode := TreeView1.Items.AddChild (BaseNode,
      'value' + IntToStr (j)) as TMyNode;
    MyNode.ExtraCode := j;
    // recursively add more nodes, up to a given level
    if MyNode.Level <= 5 then
      AddChildNodes(MyNode, Random (5));
  end;
  // let the system update the form
  Application.ProcessMessages;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  MyNode: TMyNode;
  i: Integer;
begin
  Randomize;
  for i := 1 to 5 do
  begin
    CurrentNodeClass := TMyNode;
    MyNode := TreeView1.Items.AddChild (nil,
      'item' + IntToStr (i)) as TMyNode;
    MyNode.ExtraCode := i;
    AddChildNodes(MyNode, Random (5));
  end;
end;

procedure TForm1.TreeView1Click(Sender: TObject);
var
  MyNode: TMyNode;
begin
  MyNode := TreeView1.Selected as TMyNode;
  Label1.Caption := MyNode.Text + ' [' + MyNode.ClassName + '] = ' +
    IntToStr (MyNode.ExtraCode);
end;

{ TMySubNode }

function TMySubNode.GetExtraCode: Integer;
begin
  Result := fExtraCode * (Parent as TMyNode).ExtraCode;
end;

end.
