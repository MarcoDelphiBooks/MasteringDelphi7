unit CdsXsltDm;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, DBTables, Provider, Db,
  DBClient, OleServer, xmldom, XMLIntf, msxmldom, XMLDoc, XSLProd;

type
  TWebModule1 = class(TWebModule)
    ClientDataSet1: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
    Table1: TTable;
    XMLDom: TXMLDocument;
    XSLDom: TXMLDocument;
    HTMLDom: TXMLDocument;
    procedure WebModule1WebActionItem1Action(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WebModule1: TWebModule1;

implementation

uses WebReq;

{$R *.DFM}

procedure TWebModule1.WebModule1WebActionItem1Action(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  xslfile, xslfolder: string;
  attr: IDOMAttr;
begin
  // open the client data set and load its XML in a DOM
  ClientDataSet1.Open;
  XmlDom.Xml.Text := ClientDataSet1.XMLData;
  XmlDom.Active := True;
  // load the requested xsl file
  xslfile := Request.QueryFields.Values ['style'];
  if xslfile = '' then
    xslfile := 'customer.xsl';
  xslfolder := ExtractFilePath (ParamStr (0)) + 'xsl\';
  if FileExists (xslfolder + xslfile) then
    xslDom.LoadFromFile (xslfolder + xslfile)
  else
    raise Exception.Create('Missing file: ' + xslfolder + xslfile);
  XSLDom.Active := True;
  if xslfile = 'single.xsl' then
  begin
    attr := xslDom.DOMDocument.createAttribute('select');
    attr.value := '//ROW[@CustNo="' + Request.QueryFields.Values ['id'] + '"]';
    xslDom.DOMDocument.getElementsByTagName ('xsl:apply-templates').
      item[0].attributes.setNamedItem(attr);
  end;
  // do the transformation
  HTMLDom.Active := True;
  xmlDom.DocumentElement.transformNode (
    xslDom.DocumentElement, HTMLDom);
  Response.Content := HTMLDom.XML.Text;
  // eventually save the xml (for debugging only)
  if Request.QueryFields.Values ['savexml'] = 'yes' then
    xmlDom.SaveToFile ('c:\websites\xsl\customer.xml');
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := TWebModule1;

end.
