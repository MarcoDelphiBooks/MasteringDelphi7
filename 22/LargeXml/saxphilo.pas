unit saxphilo;

interface

uses
  xdom, classes, strutils;

type
  TDataSaxHandler = class (TXmlStandardHandler)
  protected
    stack: TStringList;
    strCurrent: string;
  public
    constructor Create(aowner: TComponent); override;

    function endElement(const sender: TXmlCustomProcessorAgent;
                        const locator: TdomStandardLocator;
                              namespaceURI,
                              tagName: wideString): TXmlParserError; override;
    function PCDATA(const sender: TXmlCustomProcessorAgent;
                    const locator: TdomStandardLocator;
                          data: wideString): TXmlParserError; override;
    function startElement(const sender: TXmlCustomProcessorAgent;
                          const locator: TdomStandardLocator;
                                namespaceURI,
                                tagName: wideString;
                                attributes: TdomNameValueList): TXmlParserError; override;
    destructor Destroy; override;

  end;

implementation

uses
  LargeXmlForm, saxform;

{ TDataSaxHandler }

constructor TDataSaxHandler.Create(aowner: TComponent);
begin
  inherited;
  stack := tstringlist.create;
end;

destructor TDataSaxHandler.Destroy;
begin
  stack.Free;
  inherited;
end;

function TDataSaxHandler.endElement(const sender: TXmlCustomProcessorAgent;
  const locator: TdomStandardLocator; namespaceURI,
  tagName: wideString): TXmlParserError;
begin
  if tagName = 'employeeData' then
    Form1.clientdataset2.Post;
  if stack.Count > 2 then
  begin
    Form1.ClientDataSet2.Edit;
    Form1.ClientDataSet2.FieldByName (tagName).AsString := strCurrent;
  end;
  stack.Delete (stack.Count - 1);
  Result := nil;
end;

function TDataSaxHandler.PCDATA(const sender: TXmlCustomProcessorAgent;
  const locator: TdomStandardLocator; data: wideString): TXmlParserError;
begin
  strCurrent := strCurrent + RemoveWhites(data);
  Result := nil;
end;

function TDataSaxHandler.startElement(
  const sender: TXmlCustomProcessorAgent;
  const locator: TdomStandardLocator; namespaceURI, tagName: wideString;
  attributes: TdomNameValueList): TXmlParserError;
begin
  stack.Add (tagName);
  if tagName = 'employeeData' then
    Form1.clientdataset2.Insert;
  strCurrent := '';
  Result := nil;
end;

end.
