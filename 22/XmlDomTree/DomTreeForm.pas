unit DomTreeForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, xmldom, XMLIntf, StdCtrls, msxmldom, XMLDoc, ComCtrls, ExtCtrls;

type
  TFormXmlTree = class(TForm)
    XMLDocument1: TXMLDocument;
    btnLoad: TButton;
    OpenDialog1: TOpenDialog;
    TreeView1: TTreeView;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure btnLoadClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    procedure DomToTree(XmlNode: IXMLNode; TreeNode: TTreeNode);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormXmlTree: TFormXmlTree;

implementation

{$R *.dfm}

procedure TFormXmlTree.btnLoadClick(Sender: TObject);
begin
  OpenDialog1.InitialDir := ExtractFilePath (Application.ExeName);
  if OpenDialog1.Execute then
  begin
    XMLDocument1.LoadFromFile(OpenDialog1.FileName);
    Treeview1.Items.Clear;
    DomToTree (XMLDocument1.DocumentElement, nil);
    TreeView1.FullExpand;
  end;
end;

procedure TFormXmlTree.DomToTree (XmlNode: IXMLNode; TreeNode: TTreeNode);
var
  I: Integer;
  NewTreeNode: TTreeNode;
  NodeText: string;
  AttrNode: IXMLNode;
begin
  // skip text nodes and other special cases
  if XmlNode.NodeType <> ntElement then
    Exit;
  // add the node itself
  NodeText := XmlNode.NodeName;
  if XmlNode.IsTextElement then
    NodeText := NodeText + ' = ' + XmlNode.NodeValue;
  NewTreeNode := TreeView1.Items.AddChild(TreeNode, NodeText);
  // add attributes
  for I := 0 to xmlNode.AttributeNodes.Count - 1 do
  begin
    AttrNode := xmlNode.AttributeNodes.Nodes[I];
    TreeView1.Items.AddChild(NewTreeNode,
      '[' + AttrNode.NodeName + ' = "' + AttrNode.Text + '"]');
  end;
  // add each child node
  if XmlNode.HasChildNodes then
    for I := 0 to xmlNode.ChildNodes.Count - 1 do
      DomToTree (xmlNode.ChildNodes.Nodes [I], NewTreeNode);
end;

procedure TFormXmlTree.Button1Click(Sender: TObject);
begin
  ShowMessage (XMLDocument1.DocumentElement.
    Attributes ['text']);
//  AttributeNodes.Nodes[0].NodeValue);
end;

procedure TFormXmlTree.Button2Click(Sender: TObject);
begin
  ShowMessage (XMLDocument1.DocumentElement.
    ChildNodes.Nodes[1].ChildValues['author']);
end;

procedure TFormXmlTree.Button3Click(Sender: TObject);
begin
  // this call creates an error with an odd essage
  ShowMessage (XMLDocument1.DocumentElement.Attributes ['test']);
end;

end.
