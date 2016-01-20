unit SaxForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, OleServer, MSXML2_TLB, ActiveX, ComObj;

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

function RemoveWhites (str: WideString): WideString;


implementation

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
//  Log.Add ('--- endDocument ---');
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
//  Log.Add ('--- startDocument ---');
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

end.
