unit CreateForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, xmldom,
  XMLIntf, msxmldom, XMLDoc, DB, ComCtrls, StdCtrls, TypInfo,
  ExtCtrls, Menus, DBXpress, FMTBcd, SqlExpr;

type
  TForm1 = class(TForm)
    btnSimple: TButton;
    Memo1: TMemo;
    btnTable: TButton;
    btnObject: TButton;
    TreeView1: TTreeView;
    btnTree: TButton;
    XMLDoc: TXMLDocument;
    Button1: TButton;
    btnRTTI: TButton;
    Panel1: TPanel;
    Panel2: TPanel;
    Splitter1: TSplitter;
    SQLConnection1: TSQLConnection;
    SQLDataSet1: TSQLDataSet;
    procedure btnSimpleClick(Sender: TObject);
    procedure btnTableClick(Sender: TObject);
    procedure btnObjectClick(Sender: TObject);
    procedure btnTreeClick(Sender: TObject);
    procedure btnRTTIClick(Sender: TObject);
  private
    procedure DomToTree(XmlNode: IXMLNode; TreeNode: TTreeNode);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.btnSimpleClick(Sender: TObject);
var
  iXml: IDOMDocument;
  iRoot, iNode, iNode2, iChild, iAttribute: IDOMNode;
begin
  // empty the document
  XMLDoc.Active := False;
  XMLDoc.XML.Text := '';
  XMLDoc.Active := True;

  // root
  iXml := XmlDoc.DOMDocument;
  iRoot := iXml.appendChild (iXml.createElement ('xml'));
  // node "test"
  iNode := iRoot.appendChild (iXml.createElement ('test'));
  iNode.appendChild (iXml.createElement ('test2'));
  iChild := iNode.appendChild (iXml.createElement ('test3'));
  iChild.appendChild (iXml.createTextNode('simple value'));
  iNode.insertBefore (iXml.createElement ('test4'), iChild);

  // node replication
  iNode2 := iNode.cloneNode (True);
  iRoot.appendChild (iNode2);

  // add an attribute
  iAttribute := iXml.createAttribute ('color');
  iAttribute.nodeValue := 'red';
  iNode2.attributes.setNamedItem (iAttribute);

  // show XML in memo
  Memo1.Lines.Text := FormatXMLData (XMLDoc.XML.Text);
end;

procedure DataSetToDOM (RootName, RecordName: string;
  XMLDoc: TXmlDocument; DataSet: TDataSet);
var
  iNode, iChild: IXMLNode;
  i: Integer;
begin
  DataSet.Open;
  DataSet.First;
  // root
  XMLDoc.DocumentElement := XMLDoc.CreateNode (RootName);

  // add table data
  while not DataSet.EOF do
  begin
    // add a node for each record
    iNode := XMLDoc.DocumentElement.AddChild (RecordName);
    for I := 0 to DataSet.FieldCount - 1 do
    begin
      // add an element for each field
      iChild := iNode.AddChild (DataSet.Fields[i].FieldName);
      iChild.Text := DataSet.Fields[i].AsString;
    end;
    DataSet.Next;
  end;
  DataSet.Close;
end;

procedure TForm1.btnTableClick(Sender: TObject);
begin
  // empty the document
  XMLDoc.Active := False;
  XMLDoc.XML.Text := '';
  XMLDoc.Active := True;
                   
  // add the table to the DOM
  DataSetToDOM ('customers', 'customer', XMLDoc, SQLDataSet1);

  // show XML in memo
  Memo1.Lines := XmlDoc.XML;
end;

procedure AddAttr (iNode: IDOMNode; Name, Value: string);
var
  iAttr: IDOMNode;
begin
  iAttr := iNode.ownerDocument.createAttribute (name);
  iAttr.nodeValue := Value;
  iNode.attributes.setNamedItem (iAttr);
end;

procedure TForm1.btnObjectClick(Sender: TObject);
var
  iXml: IDOMDocument;
  iRoot: IDOMNode;
begin
  // empty the document
  XMLDoc.Active := False;
  XMLDoc.XML.Text := '';
  XMLDoc.Active := True;

  // root
  iXml := XmlDoc.DOMDocument;
  iRoot := iXml.appendChild (
    iXml.createElement ('Button1'));

  // a few properties as attributes (might also be nodes)
  AddAttr (iRoot, 'Name', Button1.Name);
  AddAttr (iRoot, 'Caption', Button1.Caption);
  AddAttr (iRoot, 'Font.Name', Button1.Font.Name); // sub-elements?
  AddAttr (iRoot, 'Left', IntToStr (Button1.Left));
  AddAttr (iRoot, 'Hint', Button1.Hint);

  // show XML in memo
  Memo1.Lines := XmlDoc.XML;
end;

procedure TForm1.DomToTree (XmlNode: IXMLNode; TreeNode: TTreeNode);
var
  I: Integer;
  NewTreeNode: TTreeNode;
  NodeText: string;
  AttrNode: IXMLNode;
begin
  // skip text nodes and other special cases
  if not (XmlNode.NodeType = ntElement) then
    Exit;
  // add the node itself
  NodeText := XmlNode.NodeName;
  if XmlNode.IsTextElement then
    NodeText := NodeText + ' = ' + XmlNode.Text;
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

procedure TForm1.btnTreeClick(Sender: TObject);
begin
  TreeView1.Items.BeginUpdate;
  try
    TreeView1.Items.Clear;
    DomToTree (XmlDoc.DocumentElement, nil);
    TreeView1.FullExpand;
  finally
    TreeView1.Items.EndUpdate;
  end;
end;

procedure ComponentToDOM (iNode: IXmlNode; Comp: TPersistent);
var
  nProps, i: Integer;
  PropList: PPropList;
  Value: Variant;
  newNode: IXmlNode;
begin
  // get list of properties
  nProps := GetTypeData (Comp.ClassInfo)^.PropCount;
  GetMem (PropList, nProps * SizeOf(Pointer));
  try
    GetPropInfos (Comp.ClassInfo, PropList);

    // shortcut: use variants...
    for i := 0 to nProps - 1 do
      if not IsDefaultPropertyValue(Comp, PropList [i], nil) then
      begin
        Value := GetPropValue (Comp, PropList [i].Name);
        NewNode := iNode.AddChild(PropList [i].Name);
        NewNode.Text := Value;
        if (PropList [i].PropType^.Kind = tkClass) and (Value <> 0) then
          if TObject (Integer(Value)) is TComponent then
            NewNode.Text := TComponent (Integer(Value)).Name
          else
            // TPersistent but not TComponent: recurse
            ComponentToDOM (newNode, TObject (Integer(Value)) as TPersistent);
      end;
  finally
    FreeMem (PropList);
  end;
end;

procedure TForm1.btnRTTIClick(Sender: TObject);
begin
  // empty the document
  XMLDoc.Active := False;
  XMLDoc.XML.Text := '';
  XMLDoc.Active := True;

  // create the root for the object and adds its properties
  XMLDoc.DocumentElement := XMLDoc.CreateNode(self.ClassName);
  ComponentToDOM (XMLDoc.DocumentElement, self);

  // show XML in memo
  Memo1.Lines := XmlDoc.XML;
end;

end.
