unit SaxForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, OleServer, MSXML2_TLB, ActiveX, ComObj;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    sax: IVBSAXXMLReader;
  public
    procedure ParseFile;
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

var
  Log: TStrings;

type
  TMySaxHandler = class (TInterfacedObject, IVBSAXContentHandler)
  protected
    stack: TStringList;
  public
    constructor Create;
    destructor Destroy; override;
    // IDispatch
    function GetTypeInfoCount(out Count: Integer): HResult; stdcall;
    function GetTypeInfo(Index, LocaleID: Integer; out TypeInfo): HResult; stdcall;
    function GetIDsOfNames(const IID: TGUID; Names: Pointer;
      NameCount, LocaleID: Integer; DispIDs: Pointer): HResult; stdcall;
    function Invoke(DispID: Integer; const IID: TGUID; LocaleID: Integer;
      Flags: Word; var Params; VarResult, ExcepInfo, ArgErr: Pointer): HResult; stdcall;

    // IVBSAXContentHandler
    procedure Set_documentLocator(const Param1: IVBSAXLocator); virtual; safecall;
    procedure startDocument; virtual; safecall;
    procedure endDocument; virtual; safecall;
    procedure startPrefixMapping(var strPrefix: WideString; var strURI: WideString); virtual; safecall;
    procedure endPrefixMapping(var strPrefix: WideString); virtual; safecall;
    procedure startElement(var strNamespaceURI: WideString; var strLocalName: WideString;
                           var strQName: WideString; const oAttributes: IVBSAXAttributes); virtual; safecall;
    procedure endElement(var strNamespaceURI: WideString; var strLocalName: WideString;
                         var strQName: WideString); virtual; safecall;
    procedure characters(var strChars: WideString); virtual; safecall;
    procedure ignorableWhitespace(var strChars: WideString); virtual; safecall;
    procedure processingInstruction(var strTarget: WideString; var strData: WideString); virtual; safecall;
    procedure skippedEntity(var strName: WideString); virtual; safecall;
  end;

  TMySimpleSaxHandler = class (TMySaxHandler)
  public
    procedure startElement(var strNamespaceURI: WideString; var strLocalName: WideString;
                           var strQName: WideString; const oAttributes: IVBSAXAttributes); override; safecall;
    procedure characters(var strChars: WideString); override; safecall;
  end;

  TMyBooksListSaxHandler = class (TMySaxHandler)
  private
    isBook: Boolean;
  public
    procedure startElement(var strNamespaceURI: WideString; var strLocalName: WideString;
                           var strQName: WideString; const oAttributes: IVBSAXAttributes); override; safecall;
    procedure characters(var strChars: WideString); override; safecall;
  end;

  TMySaxErrorHandler = class (TInterfacedObject, IVBSAXErrorHandler)
  public
    // IDispatch
    function GetTypeInfoCount(out Count: Integer): HResult; stdcall;
    function GetTypeInfo(Index, LocaleID: Integer; out TypeInfo): HResult; stdcall;
    function GetIDsOfNames(const IID: TGUID; Names: Pointer;
      NameCount, LocaleID: Integer; DispIDs: Pointer): HResult; stdcall;
    function Invoke(DispID: Integer; const IID: TGUID; LocaleID: Integer;
      Flags: Word; var Params; VarResult, ExcepInfo, ArgErr: Pointer): HResult; stdcall;

    // IVBSAXErrorHandler
    procedure error(const oLocator: IVBSAXLocator; var strErrorMessage: WideString;
                    nErrorCode: Integer); safecall;
    procedure fatalError(const oLocator: IVBSAXLocator; var strErrorMessage: WideString;
                         nErrorCode: Integer); safecall;
    procedure ignorableWarning(const oLocator: IVBSAXLocator; var strErrorMessage: WideString;
                               nErrorCode: Integer); safecall;
  end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Memo1.Clear;
  sax.ContentHandler := TMySaxHandler.Create;
  ParseFile;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Log := Memo1.Lines;
  // create sax and connect error handler
  sax := CoSAXXMLReader.Create;
  sax.ErrorHandler := TMySaxErrorHandler.Create;
end;

{ TMySaxHandler }

function RemoveWhites (str: WideString): WideString;
var
  i: integer;
begin
  for i := 1 to Length (str) do
    if Ord(str[i]) >= 32 then
      Result := Result + str [i];
  Result := Trim (Result);
end;

procedure TMySaxHandler.characters(var strChars: WideString);
begin
end;

constructor TMySaxHandler.Create;
begin
  stack := TStringList.Create;
end;

destructor TMySaxHandler.Destroy;
begin
  inherited;
  stack.Free;
end;

procedure TMySaxHandler.endDocument;
begin
  Log.Add ('--- endDocument ---');
end;

procedure TMySaxHandler.endElement(var strNamespaceURI, strLocalName,
  strQName: WideString);
begin
  stack.Delete (stack.Count - 1);
end;

procedure TMySaxHandler.endPrefixMapping(var strPrefix: WideString);
begin

end;

function TMySaxHandler.GetIDsOfNames(const IID: TGUID; Names: Pointer;
  NameCount, LocaleID: Integer; DispIDs: Pointer): HResult;
begin
  Result := E_NOTIMPL;
end;

function TMySaxHandler.GetTypeInfo(Index, LocaleID: Integer;
  out TypeInfo): HResult;
begin
  Result := E_NOTIMPL;
end;

function TMySaxHandler.GetTypeInfoCount(out Count: Integer): HResult;
begin
  Result := E_NOTIMPL;
end;

procedure TMySaxHandler.ignorableWhitespace(var strChars: WideString);
begin

end;

function TMySaxHandler.Invoke(DispID: Integer; const IID: TGUID;
  LocaleID: Integer; Flags: Word; var Params; VarResult, ExcepInfo,
  ArgErr: Pointer): HResult;
begin
  Result := E_NOTIMPL;
end;

procedure TMySaxHandler.processingInstruction(var strTarget,
  strData: WideString);
begin

end;

procedure TMySaxHandler.Set_documentLocator(const Param1: IVBSAXLocator);
begin

end;

procedure TMySaxHandler.skippedEntity(var strName: WideString);
begin

end;

procedure TMySaxHandler.startDocument;
begin
  Log.Add ('--- startDocument ---');
end;

procedure TMySaxHandler.startElement(var strNamespaceURI, strLocalName,
  strQName: WideString; const oAttributes: IVBSAXAttributes);
begin
  stack.Add (strLocalName);
end;

procedure TMySaxHandler.startPrefixMapping(var strPrefix,
  strURI: WideString);
begin

end;

{ TMySaxErrorHandler }

procedure TMySaxErrorHandler.error(const oLocator: IVBSAXLocator;
  var strErrorMessage: WideString; nErrorCode: Integer);
begin
  Log.Add ('[Error] ' +
    IntToStr (oLocator.lineNumber) + '.' + IntToStr (oLocator.columnNumber) + ':' +
    strErrorMessage);
end;

procedure TMySaxErrorHandler.fatalError(const oLocator: IVBSAXLocator;
  var strErrorMessage: WideString; nErrorCode: Integer);
begin
  Log.Add ('[Fatal] ' +
    IntToStr (oLocator.lineNumber) + '.' + IntToStr (oLocator.columnNumber) + ':' +
    strErrorMessage);
end;

function TMySaxErrorHandler.GetIDsOfNames(const IID: TGUID; Names: Pointer;
  NameCount, LocaleID: Integer; DispIDs: Pointer): HResult;
begin
  Result := E_NOTIMPL;
end;

function TMySaxErrorHandler.GetTypeInfo(Index, LocaleID: Integer;
  out TypeInfo): HResult;
begin
  Result := E_NOTIMPL;
end;

function TMySaxErrorHandler.GetTypeInfoCount(out Count: Integer): HResult;
begin
  Result := E_NOTIMPL;
end;

procedure TMySaxErrorHandler.ignorableWarning(
  const oLocator: IVBSAXLocator; var strErrorMessage: WideString;
  nErrorCode: Integer);
begin
  Log.Add ('[Warning] ' +
    IntToStr (oLocator.lineNumber) + '.' + IntToStr (oLocator.columnNumber) + ':' +
    strErrorMessage);
end;

function TMySaxErrorHandler.Invoke(DispID: Integer; const IID: TGUID;
  LocaleID: Integer; Flags: Word; var Params; VarResult, ExcepInfo,
  ArgErr: Pointer): HResult;
begin
  Result := E_NOTIMPL;
end;

{ TMySimpleSaxHandler }

procedure TMySimpleSaxHandler.characters(var strChars: WideString);
var
  str: WideString;
begin
  inherited;

  str := RemoveWhites (strChars);
  if (str <> '') then
    Log.Add ('Text: ' + str);
end;

procedure TMySimpleSaxHandler.startElement(var strNamespaceURI,
  strLocalName, strQName: WideString; const oAttributes: IVBSAXAttributes);
begin
  inherited;
  Log.Add (strLocalName + '(' + stack.CommaText + ')');
end;

{ TMyBooksListSaxHandler }

procedure TMyBooksListSaxHandler.characters(var strChars: WideString);
var
  str: string;
begin
  inherited;
  if isbook then
  begin
    str := RemoveWhites (strChars);
    if (str <> '') then
      Log.Add (stack.CommaText + ': ' + str);
  end;
end;

procedure TMyBooksListSaxHandler.startElement(var strNamespaceURI,
  strLocalName, strQName: WideString; const oAttributes: IVBSAXAttributes);
begin
  inherited;
  isbook := (strLocalName = 'title');
end;

procedure TForm1.ParseFile;
var
  filename: string;
begin
  filename := ExtractFilePath (Application.Exename) + 'books.xml';
  if FileExists (filename) then
  begin
    sax.parseURL (filename)
  end
  else
    Log.Add ('file not found: ' + filename);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Memo1.Clear;
  sax.ContentHandler := TMySimpleSaxHandler.Create;
  ParseFile;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Memo1.Clear;
  sax.ContentHandler := TMyBooksListSaxHandler.Create;
  ParseFile;
end;

end.
