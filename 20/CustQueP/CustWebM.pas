unit CustWebM;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, Db, DBTables, DBWeb,
  HTTPProd, DBBdeWeb, FMTBcd, DBXpress, SqlExpr, DBXpressWeb;

type
  TWebModule1 = class(TWebModule)
    PageProducer1: TPageProducer;
    SQLQueryTableProducer1: TSQLQueryTableProducer;
    SQLQuery1: TSQLQuery;
    SQLConnection1: TSQLConnection;
    SQLQuery2: TSQLQuery;
    procedure PageProducer1HTMLTag(Sender: TObject; Tag: TTag;
      const TagString: String; TagParams: TStrings;
      var ReplaceText: String);
    procedure RecordAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure SQLQueryTableProducer1FormatCell(Sender: TObject; CellRow,
      CellColumn: Integer; var BgColor: THTMLBgColor;
      var Align: THTMLAlign; var VAlign: THTMLVAlign; var CustomAttrs,
      CellData: String);
  end;

var
  WebModule1: TWebModule1;

implementation

uses WebReq;

{$R *.DFM}

procedure TWebModule1.PageProducer1HTMLTag(Sender: TObject; Tag: TTag;
  const TagString: String; TagParams: TStrings; var ReplaceText: String);
begin
  if TagString = 'script' then
    ReplaceText := Request.InternalScriptName
  else
  begin
    ReplaceText := '';
    SQLQuery2.SQL.Clear;
    SQLQuery2.SQL.Add ('select distinct ' +
      TagString + ' from customer');
    try
      SQLQuery2.Open;
      try
        SQLQuery2.First;
        while not SQLQuery2.EOF do
        begin
          ReplaceText := ReplaceText +
            '<option>' + SQLQuery2.Fields[0].AsString +
            '</option>'#13;
          SQLQuery2.Next;
        end;
      finally
        SQLQuery2.Close;
      end;
    except
      ReplaceText := '{wrong field: ' + TagString + '}';
    end;
  end;
end;

procedure TWebModule1.RecordAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  I: Integer;
begin
  if Request.QueryFields.Count = 0 then
    Response.Content := 'Record not found'
  else
  begin
    SQLQuery2.SQL.Clear;
    SQLQuery2.SQL.Add ('select * from customer ' +
      'where customer="' + Request.QueryFields.Values['Company'] + '"');
    SQLQuery2.Open;
    Response.Content :=
      '<HTML><HEAD><TITLE>Customer Record</TITLE></HEAD><BODY>'#13 +
      '<H1>Customer Record: ' + Request.QueryFields[0] +
      '</H1>'#13 +
      '<table border>'#13;
    for I := 1 to SQLQuery2.FieldCount - 1 do
      Response.Content := Response.Content +
        '<tr><td>' + SQLQuery2.Fields [I].FieldName +
        '</td>'#13'<td>' + SQLQuery2.Fields [I].AsString +
        '</td></tr>'#13;
    Response.Content := Response.Content +
      '</table><hr>'#13 +
      // pointer to the query form
      '<a HREF="' + Request.InternalScriptName + '/form">' +
      ' Next Query </a>'#13 +
      '</BODY></HTML>'#13;
  end;
end;

procedure TWebModule1.SQLQueryTableProducer1FormatCell(Sender: TObject;
  CellRow, CellColumn: Integer; var BgColor: THTMLBgColor;
  var Align: THTMLAlign; var VAlign: THTMLVAlign; var CustomAttrs,
  CellData: String);
begin
  if (CellColumn = 0) and (CellRow <> 0) then
    CellData := '<a HREF="' + Request.InternalScriptName +
      '/record?Company=' + CellData + '">' + CellData + '</a>'#13;
  if CellData = '' then
    CellData := '&nbsp;';
end;

initialization
  WebRequestHandler.WebModuleClass := TWebModule1;

end.
