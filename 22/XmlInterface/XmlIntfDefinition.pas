
{***************************************************************}
{                                                               }
{                    Delphi XML Data Binding                    }
{                                                               }
{         Generated on: 6/4/2001 6:44:51 PM                     }
{       Generated from: C:\md6code\23\XmlInterface\Sample.xml   }
{                                                               }
{***************************************************************}
unit XmlIntfDefinition;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  IXMLBooksType = interface;
  IXMLBookType = interface;
  IXMLBookTypeList = interface;
  IXMLEbookType = interface;
  IXMLEbookTypeList = interface;
  IXMLString_List = interface;

{ IXMLBooksType }

  IXMLBooksType = interface(IXMLNode)
    ['{C9A9FB63-47ED-4F27-8ABA-E71F30BA7F11}']
    { Property Accessors }
    function Get_Text: WideString;
    function Get_Book: IXMLBookTypeList;
    function Get_Ebook: IXMLEbookTypeList;
    procedure Set_Text(Value: WideString);
    { Methods & Properties }
    property Text: WideString read Get_Text write Set_Text;
    property Book: IXMLBookTypeList read Get_Book;
    property Ebook: IXMLEbookTypeList read Get_Ebook;
  end;

{ IXMLBookType }

  IXMLBookType = interface(IXMLNode)
    ['{26BF5C51-9247-4D1A-8584-24AE68969935}']
    { Property Accessors }
    function Get_Title: WideString;
    function Get_Author: IXMLString_List;
    procedure Set_Title(Value: WideString);
    { Methods & Properties }
    property Title: WideString read Get_Title write Set_Title;
    property Author: IXMLString_List read Get_Author;
  end;

{ IXMLBookTypeList }

  IXMLBookTypeList = interface(IXMLNodeCollection)
    ['{3449E8C4-3222-47B8-B2B2-38EE504790B6}']
    { Methods & Properties }
    function Add: IXMLBookType;
    function Insert(const Index: Integer): IXMLBookType;
    function Get_Item(Index: Integer): IXMLBookType;
    property Items[Index: Integer]: IXMLBookType read Get_Item; default;
  end;

{ IXMLEbookType }

  IXMLEbookType = interface(IXMLNode)
    ['{79F0237E-3596-40DD-ADBE-954AA7F6304F}']
    { Property Accessors }
    function Get_Title: WideString;
    function Get_Url: WideString;
    function Get_Author: WideString;
    procedure Set_Title(Value: WideString);
    procedure Set_Url(Value: WideString);
    procedure Set_Author(Value: WideString);
    { Methods & Properties }
    property Title: WideString read Get_Title write Set_Title;
    property Url: WideString read Get_Url write Set_Url;
    property Author: WideString read Get_Author write Set_Author;
  end;

{ IXMLEbookTypeList }

  IXMLEbookTypeList = interface(IXMLNodeCollection)
    ['{9713B729-340C-40EB-91AB-635FEF553EA5}']
    { Methods & Properties }
    function Add: IXMLEbookType;
    function Insert(const Index: Integer): IXMLEbookType;
    function Get_Item(Index: Integer): IXMLEbookType;
    property Items[Index: Integer]: IXMLEbookType read Get_Item; default;
  end;

{ IXMLString_List }

  IXMLString_List = interface(IXMLNodeCollection)
    ['{5DE9DF5D-9DE0-4654-B0D6-0CF330280950}']
    { Methods & Properties }
    function Add(const Value: WideString): IXMLNode;
    function Insert(const Index: Integer; const Value: WideString): IXMLNode;
    function Get_Item(Index: Integer): WideString;
    property Items[Index: Integer]: WideString read Get_Item; default;
  end;

{ Forward Decls }

  TXMLBooksType = class;
  TXMLBookType = class;
  TXMLBookTypeList = class;
  TXMLEbookType = class;
  TXMLEbookTypeList = class;
  TXMLString_List = class;

{ TXMLBooksType }

  TXMLBooksType = class(TXMLNode, IXMLBooksType)
  private
    FBook: IXMLBookTypeList;
    FEbook: IXMLEbookTypeList;
  protected
    { IXMLBooksType }
    function Get_Text: WideString;
    function Get_Book: IXMLBookTypeList;
    function Get_Ebook: IXMLEbookTypeList;
    procedure Set_Text(Value: WideString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLBookType }

  TXMLBookType = class(TXMLNode, IXMLBookType)
  private
    FAuthor: IXMLString_List;
  protected
    { IXMLBookType }
    function Get_Title: WideString;
    function Get_Author: IXMLString_List;
    procedure Set_Title(Value: WideString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLBookTypeList }

  TXMLBookTypeList = class(TXMLNodeCollection, IXMLBookTypeList)
  protected
    { IXMLBookTypeList }
    function Add: IXMLBookType;
    function Insert(const Index: Integer): IXMLBookType;
    function Get_Item(Index: Integer): IXMLBookType;
  end;

{ TXMLEbookType }

  TXMLEbookType = class(TXMLNode, IXMLEbookType)
  protected
    { IXMLEbookType }
    function Get_Title: WideString;
    function Get_Url: WideString;
    function Get_Author: WideString;
    procedure Set_Title(Value: WideString);
    procedure Set_Url(Value: WideString);
    procedure Set_Author(Value: WideString);
  end;

{ TXMLEbookTypeList }

  TXMLEbookTypeList = class(TXMLNodeCollection, IXMLEbookTypeList)
  protected
    { IXMLEbookTypeList }
    function Add: IXMLEbookType;
    function Insert(const Index: Integer): IXMLEbookType;
    function Get_Item(Index: Integer): IXMLEbookType;
  end;

{ TXMLString_List }

  TXMLString_List = class(TXMLNodeCollection, IXMLString_List)
  protected
    { IXMLString_List }
    function Add(const Value: WideString): IXMLNode;
    function Insert(const Index: Integer; const Value: WideString): IXMLNode;
    function Get_Item(Index: Integer): WideString;
  end;

{ Global Functions }

function Getbooks(Doc: IXMLDocument): IXMLBooksType;
function Loadbooks(const FileName: WideString): IXMLBooksType;
function Newbooks: IXMLBooksType;

implementation

{ Global Functions }

function Getbooks(Doc: IXMLDocument): IXMLBooksType;
begin
  Result := Doc.GetDocBinding('books', TXMLBooksType) as IXMLBooksType;
end;
function Loadbooks(const FileName: WideString): IXMLBooksType;
begin
  Result := LoadXMLDocument(FileName).GetDocBinding('books', TXMLBooksType) as IXMLBooksType;
end;

function Newbooks: IXMLBooksType;
begin
  Result := NewXMLDocument.GetDocBinding('books', TXMLBooksType) as IXMLBooksType;
end;

{ TXMLBooksType }

procedure TXMLBooksType.AfterConstruction;
begin
  RegisterChildNode('book', TXMLBookType);
  RegisterChildNode('ebook', TXMLEbookType);
  FBook := CreateCollection(TXMLBookTypeList, IXMLBookType, 'book') as IXMLBookTypeList;
  FEbook := CreateCollection(TXMLEbookTypeList, IXMLEbookType, 'ebook') as IXMLEbookTypeList;
  inherited;
end;

function TXMLBooksType.Get_Text: WideString;
begin
  Result := AttributeNodes['text'].Text;
end;

procedure TXMLBooksType.Set_Text(Value: WideString);
begin
  SetAttribute('text', Value);
end;

function TXMLBooksType.Get_Book: IXMLBookTypeList;
begin
  Result := FBook;
end;

function TXMLBooksType.Get_Ebook: IXMLEbookTypeList;
begin
  Result := FEbook;
end;

{ TXMLBookType }

procedure TXMLBookType.AfterConstruction;
begin
  FAuthor := CreateCollection(TXMLString_List, IXMLNode, 'author') as IXMLString_List;
  inherited;
end;

function TXMLBookType.Get_Title: WideString;
begin
  Result := ChildNodes['title'].Text;
end;

procedure TXMLBookType.Set_Title(Value: WideString);
begin
  ChildNodes['title'].NodeValue := Value;
end;

function TXMLBookType.Get_Author: IXMLString_List;
begin
  Result := FAuthor;
end;

{ TXMLBookTypeList }

function TXMLBookTypeList.Add: IXMLBookType;
begin
  Result := AddItem(-1) as IXMLBookType;
end;

function TXMLBookTypeList.Insert(const Index: Integer): IXMLBookType;
begin
  Result := AddItem(Index) as IXMLBookType;
end;

function TXMLBookTypeList.Get_Item(Index: Integer): IXMLBookType;
begin
  Result := List[Index] as IXMLBookType;
end;

{ TXMLEbookType }

function TXMLEbookType.Get_Title: WideString;
begin
  Result := ChildNodes['title'].Text;
end;

procedure TXMLEbookType.Set_Title(Value: WideString);
begin
  ChildNodes['title'].NodeValue := Value;
end;

function TXMLEbookType.Get_Url: WideString;
begin
  Result := ChildNodes['url'].Text;
end;

procedure TXMLEbookType.Set_Url(Value: WideString);
begin
  ChildNodes['url'].NodeValue := Value;
end;

function TXMLEbookType.Get_Author: WideString;
begin
  Result := ChildNodes['author'].Text;
end;

procedure TXMLEbookType.Set_Author(Value: WideString);
begin
  ChildNodes['author'].NodeValue := Value;
end;

{ TXMLEbookTypeList }

function TXMLEbookTypeList.Add: IXMLEbookType;
begin
  Result := AddItem(-1) as IXMLEbookType;
end;

function TXMLEbookTypeList.Insert(const Index: Integer): IXMLEbookType;
begin
  Result := AddItem(Index) as IXMLEbookType;
end;

function TXMLEbookTypeList.Get_Item(Index: Integer): IXMLEbookType;
begin
  Result := List[Index] as IXMLEbookType;
end;

{ TXMLString_List }

function TXMLString_List.Add(const Value: WideString): IXMLNode;
begin
  Result := AddItem(-1);
  Result.NodeValue := Value;
end;


function TXMLString_List.Insert(const Index: Integer; const Value: WideString): IXMLNode;
begin
  Result := AddItem(Index);
  Result.NodeValue := Value;
end;


function TXMLString_List.Get_Item(Index: Integer): WideString;
begin
  Result := List[Index].NodeValue;
end;

end.
