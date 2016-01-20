unit BrokWm;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, Db, DSProd,
  DBWeb, HTTPProd, DBClient, SimpleDS, Variants;

type
  TWebModule1 = class(TWebModule)
    PageHead: TPageProducer;
    DataSetPage: TDataSetPageProducer;
    PageTail: TPageProducer;
    DataSetTableProducer1: TDataSetTableProducer;
    dataEmployee: TSimpleDataSet;
    dataEmployeeEMP_NO: TSmallintField;
    dataEmployeeFIRST_NAME: TStringField;
    dataEmployeeLAST_NAME: TStringField;
    dataEmployeePHONE_EXT: TStringField;
    dataEmployeeHIRE_DATE: TSQLTimeStampField;
    dataEmployeeSALARY: TFMTBCDField;
    procedure TimeAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
    procedure DateAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
    procedure MenuAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
    procedure StatusAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure RecordAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure PageTailHTMLTag(Sender: TObject; Tag: TTag;
      const TagString: String; TagParams: TStrings;
      var ReplaceText: String);
    procedure DataSetTableProducer1FormatCell(Sender: TObject; CellRow,
      CellColumn: Integer; var BgColor: THTMLBgColor;
      var Align: THTMLAlign; var VAlign: THTMLVAlign; var CustomAttrs,
      CellData: String);
    procedure WebModule1AfterDispatch(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1WaTableAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
  public
    { Public declarations }
  end;

var
  WebModule1: TWebModule1;

implementation

uses
  WebReq;

{$R *.DFM}

procedure TWebModule1.TimeAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Response.Content := 'Time at this site: ' +
    FormatDateTime('hh:mm:ss AM/PM', Now) + '<p>';
end;

procedure TWebModule1.DateAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Response.Content := 'Today is ' +
    FormatDateTime('dddd, mmmm d, yyyy', Now) + '<p>';
end;

procedure TWebModule1.MenuAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  I: Integer;
begin
  Response.Content := '<H3>Menu</H3><ul>'#13;
  for I := 0 to Actions.Count - 1 do
    Response.Content := Response.Content +
      '<li> <a href="' + Request.ScriptName +
      Action[I].PathInfo + '"> ' + Copy (Action[I].Name, 3, 1000) + '</a>'#13;
  Response.Content := Response.Content + '</ul>';
end;

procedure TWebModule1.StatusAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  I: Integer;
begin
  Response.Content := '<H3>Status</H3>'#13 +
    'Method: ' + Request.Method + '<br>'#13 +
    'ProtocolVersion: ' + Request.ProtocolVersion + '<br>'#13 +
    'URL: ' + Request.URL + '<br>'#13 +
    'Query: ' + Request.Query + '<br>'#13 +
    'PathInfo: ' + Request.PathInfo + '<br>'#13 +
    'PathTranslated: ' + Request.PathTranslated + '<br>'#13 +
    'Authorization: ' + Request.Authorization + '<br>'#13 +
    'CacheControl: ' + Request.CacheControl + '<br>'#13 +
    'Cookie: ' + Request.Cookie + '<br>'#13 +
    'Date: ' + DateTimeToStr (Request.Date) + '<br>'#13 +
    'Accept: ' + Request.Accept + '<br>'#13 +
    'From: ' + Request.From + '<br>'#13 +
    'Host: ' + Request.Host + '<br>'#13 +
    'IfModifiedSince: ' + DateTimeToStr (Request.IfModifiedSince) + '<br>'#13 +
    'Referer: ' + Request.Referer + '<br>'#13 +
    'UserAgent: ' + Request.UserAgent + '<br>'#13 +
    'ContentEncoding: ' + Request.ContentEncoding + '<br>'#13 +
    'ContentType: ' + Request.ContentType + '<br>'#13 +
    'ContentLength: ' + IntToStr (Request.ContentLength) + '<br>'#13 +
    'ContentVersion: ' + Request.ContentVersion + '<br>'#13 +
    'Content: ' + Request.Content + '<br>'#13 +
    'Connection: ' + Request.Connection + '<br>'#13 +
    'DerivedFrom: ' + Request.DerivedFrom + '<br>'#13 +
    'Expires: ' + DateTimeToStr (Request.Expires) + '<br>'#13 +
    'Title: ' + Request.Title + '<br>'#13 +
    'RemoteAddr: ' + Request.RemoteAddr + '<br>'#13 +
    'RemoteHost: ' + Request.RemoteHost + '<br>'#13 +
    'ScriptName: ' + Request.ScriptName + '<br>'#13 +
    'ServerPort: ' + IntToStr (Request.ServerPort) + '<br>'#13;
  // list of strings
  Response.Content := Response.Content +
    'ContentFields:<ul>'#13;
  for I := 0 to Request.ContentFields.Count - 1 do
    Response.Content := Response.Content +
      '<li>' + Request.ContentFields [I]+ #13;
  Response.Content := Response.Content +
    '</ul>CookieFields:<ul>'#13;
  for I := 0 to Request.CookieFields.Count - 1 do
    Response.Content := Response.Content +
      '<li>' + Request.CookieFields [I] + #13;
  Response.Content := Response.Content +
    '</ul>QueryFields:<ul>'#13;
  for I := 0 to Request.QueryFields.Count - 1 do
    Response.Content := Response.Content +
      '<li>' + Request.QueryFields [I] + #13;
end;

procedure TWebModule1.RecordAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  dataEmployee.Open;
  // go to the requested record
  dataEmployee.Locate ('LAST_NAME;FIRST_NAME', VarArrayOf([Request.QueryFields.Values['LastName'],
    Request.QueryFields.Values['FirstName']]), []);

  // get the output
  Response.Content := DataSetPage.Content;
end;

procedure TWebModule1.PageTailHTMLTag(Sender: TObject; Tag: TTag;
  const TagString: String; TagParams: TStrings; var ReplaceText: String);
begin
  if TagString = 'script' then
    ReplaceText := Request.ScriptName;
end;

procedure TWebModule1.DataSetTableProducer1FormatCell(Sender: TObject;
  CellRow, CellColumn: Integer; var BgColor: THTMLBgColor;
  var Align: THTMLAlign; var VAlign: THTMLVAlign; var CustomAttrs,
  CellData: String);
begin
  if (CellColumn = 0) and (CellRow <> 0) then
    CellData := '<a href="' + Request.ScriptName + '/record?LastName=' +
      dataEmployee['Last_Name'] + '&FirstName=' + dataEmployee['First_Name'] + '"> '
      + CellData + ' </a>';
end;

procedure TWebModule1.WebModule1AfterDispatch(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Response.Content := PageHead.Content +
    Response.Content + PageTail.Content;
end;

procedure TWebModule1.WebModule1WaTableAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  dataEmployee.Open;
  dataEmployee.First;
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := TWebModule1;

end.
