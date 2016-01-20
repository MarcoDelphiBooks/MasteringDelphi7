unit DBHForm;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics,
  Controls, Forms, DBCtrls, StdCtrls, DBTables,
  ExtCtrls, Mask, Db, Dialogs, HTTPApp, DSProd, DBWeb, HTTPProd,
  IdBaseComponent, IdComponent, IdTCPServer, IdHTTPServer,
  IdCustomHTTPServer, DBClient;

type
  TFormProd = class(TForm)
    BtnPrintAll: TButton;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    DBNavigator1: TDBNavigator;
    DataSource1: TDataSource;
    SaveDialog1: TSaveDialog;
    Memo1: TMemo;
    BtnSave: TButton;
    CheckStart: TCheckBox;
    BtnLine: TButton;
    PageProducer1: TPageProducer;
    DataSetPageProducer1: TDataSetPageProducer;
    BtnDemo: TButton;
    DataSetTableProducer1: TDataSetTableProducer;
    DataSetTableProducer2: TDataSetTableProducer;
    cbCss: TCheckBox;
    IdHTTPServer1: TIdHTTPServer;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1Name: TStringField;
    ClientDataSet1Capital: TStringField;
    ClientDataSet1Continent: TStringField;
    ClientDataSet1Area: TFloatField;
    ClientDataSet1Population: TFloatField;
    procedure BtnPrintAllClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure BtnLineClick(Sender: TObject);
    procedure DataSetPageProducer1HTMLTag(Sender: TObject; Tag: TTag;
      const TagString: String; TagParams: TStrings;
      var ReplaceText: String);
    procedure PageProducer1HTMLTag(Sender: TObject; Tag: TTag;
      const TagString: String; TagParams: TStrings;
      var ReplaceText: String);
    procedure BtnDemoClick(Sender: TObject);
    procedure DataSetTableProducer1FormatCell(Sender: TObject; CellRow,
      CellColumn: Integer; var BgColor: THTMLBgColor;
      var Align: THTMLAlign; var VAlign: THTMLVAlign; var CustomAttrs,
      CellData: String);
    procedure DataSetTableProducer2FormatCell(Sender: TObject; CellRow,
      CellColumn: Integer; var BgColor: THTMLBgColor;
      var Align: THTMLAlign; var VAlign: THTMLVAlign; var CustomAttrs,
      CellData: String);
    procedure IdHTTPServer1CommandGet(AThread: TIdPeerThread;
      RequestInfo: TIdHTTPRequestInfo; ResponseInfo: TIdHTTPResponseInfo);
    procedure FormCreate(Sender: TObject);
  end;

var
  FormProd: TFormProd;

implementation

{$R *.DFM}

uses
  ShellAPI;

procedure TFormProd.BtnPrintAllClick(Sender: TObject);
begin
  ClientDataSet1.First;
  Memo1.Clear;
  if not cbCss.Checked then
    Memo1.Text := DataSetTableProducer1.Content
  else
    Memo1.Text := DataSetTableProducer2.Content;
  BtnSave.Enabled := True;
end;

procedure TFormProd.BtnSaveClick(Sender: TObject);
begin
  if SaveDialog1.Execute then
  begin
    Memo1.Lines.SaveToFile (SaveDialog1.FileName);
    if CheckStart.Checked then
      ShellExecute (Handle, 'open',
        PChar (SaveDialog1.FileName),
        '', '', sw_ShowNormal);
  end;
end;

procedure TFormProd.BtnLineClick(Sender: TObject);
begin
  Memo1.Clear;
  Memo1.Text := DataSetPageProducer1.Content;
  BtnSave.Enabled := True;
end;

procedure TFormProd.DataSetPageProducer1HTMLTag(Sender: TObject; Tag: TTag;
  const TagString: String; TagParams: TStrings; var ReplaceText: String);
begin
  if TagString = 'program' then
    ReplaceText := ExtractFilename (Forms.Application.Exename)
  else if TagString = 'date' then
    ReplaceText := DateToStr (Date);
end;

procedure TFormProd.PageProducer1HTMLTag(Sender: TObject; Tag: TTag;
  const TagString: String; TagParams: TStrings; var ReplaceText: String);
var
  nDays: Integer;
begin
  if TagString = 'date' then
    ReplaceText := DateToStr (Now)
  else if TagString = 'appname' then
    ReplaceText := ExtractFilename (Forms.Application.Exename)
  else if TagString = 'expiration' then
  begin
    nDays := StrToIntDef (TagParams.Values['days'], 0);
    if nDays <> 0 then
      ReplaceText := DateToStr (Now + nDays)
    else
      ReplaceText := '<I>{expiration tag error}</I>';
  end;
end;

procedure TFormProd.BtnDemoClick(Sender: TObject);
begin
  Memo1.Clear;
  Memo1.Text := PageProducer1.Content;
  BtnSave.Enabled := True;
end;

procedure TFormProd.DataSetTableProducer1FormatCell(Sender: TObject;
  CellRow, CellColumn: Integer; var BgColor: THTMLBgColor;
  var Align: THTMLAlign; var VAlign: THTMLVAlign; var CustomAttrs,
  CellData: String);
begin
  if (CellRow > 0) and (((CellColumn = 3) and (Length (CellData) > 8)) or
     ((CellColumn = 4) and (Length (CellData) > 9))) then
  begin
    BgColor := 'red';
    CellData := '<b>' + CellData + '</b>';
  end;
end;

procedure TFormProd.DataSetTableProducer2FormatCell(Sender: TObject;
  CellRow, CellColumn: Integer; var BgColor: THTMLBgColor;
  var Align: THTMLAlign; var VAlign: THTMLVAlign; var CustomAttrs,
  CellData: String);
begin
  if (CellRow > 0) and (((CellColumn = 3) and (Length (CellData) > 8)) or
      ((CellColumn = 4) and (Length (CellData) > 9))) then
    CustomAttrs := 'class="highlight"';
end;

procedure TFormProd.IdHTTPServer1CommandGet(AThread: TIdPeerThread;
  RequestInfo: TIdHTTPRequestInfo; ResponseInfo: TIdHTTPResponseInfo);
var
  I: Integer;
  Req, Html: String;
  CssTest: TStringList;
  Comp: TComponent;
begin
  // version 1: see what's selected
  // ResponseInfo.ContentText := Memo1.Text;

  // version 2: use path
  Req := RequestInfo.Document;
  if Pos ('test.css', Req) > 0 then
  begin
    CssTest := TStringList.Create;
    try
      CssTest.LoadFromFile (ExtractFilePath (
        Application.ExeName) + 'test.css');
      ResponseInfo.ContentText := CssTest.Text;
      ResponseInfo.ContentType := 'text/css';
    finally
      CssTest.Free;
    end;
    Exit;
  end;
  // standard request
  if Req [1] = '/' then
    Req := Copy (Req, 2, 1000); // skip '/'
  Comp := FindComponent (Req);
  if (Req <> '') and Assigned (Comp) and
    (Comp is TCustomContentProducer) then
  begin
    ClientDataSet1.First;
    Html := TCustomContentProducer (Comp).Content;
  end
  else
  begin
    // define a menu
    Html := '<h1>HtmlProd Menu<h1><p><ul>';
    for I := 0 to ComponentCount - 1 do
      if Components [i] is TCustomContentProducer then
        Html := Html + '<li><a href="/' + Components [i].Name +
          '">' + Components [i].Name + '</a></li>';
    Html := Html + '</ul></p>';
  end;
  ResponseInfo.ContentText := Html;
end;

procedure TFormProd.FormCreate(Sender: TObject);
begin
  ClientDataSet1.Open;
end;

end.
