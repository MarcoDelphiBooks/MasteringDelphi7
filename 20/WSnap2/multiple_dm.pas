
unit multiple_dm;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, WebModu, HTTPProd,
  WebAdapt, WebComp, CompProd, PagItems, SiteProd, MidItems, WebForm;

type
  Tmultiple = class(TWebPageModule)
    AdapterPageProducer: TAdapterPageProducer;
    PagedAdapter1: TPagedAdapter;
    NumbersList: TStringsValuesList;
    AdapterForm1: TAdapterForm;
    AdapterGrid1: TAdapterGrid;
    AdapterCommandGroup1: TAdapterCommandGroup;
    CmdPrevPage: TAdapterActionButton;
    CmdGotoPage: TAdapterActionButton;
    CmdNextPage: TAdapterActionButton;
    Number: TAdapterMultiValueField;
    Square: TAdapterMultiValueField;
    ColNumber: TAdapterDisplayColumn;
    ColSquare: TAdapterDisplayColumn;
    AdapterField: TAdapterField;
    procedure WebPageModuleActivate(Sender: TObject);
    procedure NumberGetValues(Sender: TObject;
      Index: Integer; var Value: Variant);
    procedure NumberGetValueCount(Sender: TObject;
      var Count: Integer);
    procedure SquareGetValues(Sender: TObject; Index: Integer;
      var Value: Variant);
    procedure PagedAdapter1GetRecordCount(Sender: TObject;
      var Count: Integer);
    procedure PagedAdapter1GetNextRecord(Sender: TObject;
      var EOF: Boolean);
    procedure PagedAdapter1GetFirstRecord(Sender: TObject;
      var EOF: Boolean);
    procedure PagedAdapter1GetEOF(Sender: TObject; var EOF: Boolean);
    procedure PagedAdapter1GetRecordIndex(Sender: TObject;
      var Index: Integer);
    procedure AdapterFieldGetValue(Sender: TObject; var Value: Variant);
  private
    CurrentPos: Integer;
  public
    { Public declarations }
  end;

  function multiple: Tmultiple;

implementation

{$R *.dfm}  {*.html}

uses WebReq, WebCntxt, WebFact, Variants;

function multiple: Tmultiple;
begin
  Result := Tmultiple(WebContext.FindModuleClass(Tmultiple));
end;

procedure Tmultiple.WebPageModuleActivate(Sender: TObject);
var
  i: Integer;
begin
  for i := 1 to 100 do
    NumbersList.Strings.Add(
      IntToStr(i) + '=' + IntToStr (Sqr(i)));
end;

procedure Tmultiple.NumberGetValues(Sender: TObject;
  Index: Integer; var Value: Variant);
begin
  Value := NumbersList.Strings.Names [Index];
end;

procedure Tmultiple.NumberGetValueCount(Sender: TObject;
  var Count: Integer);
begin
  Count := NumbersList.Strings.Count;
end;

procedure Tmultiple.SquareGetValues(Sender: TObject; Index: Integer;
  var Value: Variant);
begin
  with NumbersList.Strings do
    Value := Values [Names [Index]];
end;

procedure Tmultiple.PagedAdapter1GetRecordCount(Sender: TObject;
  var Count: Integer);
begin
  Count := NumbersList.Strings.Count;
end;

procedure Tmultiple.PagedAdapter1GetNextRecord(Sender: TObject;
  var EOF: Boolean);
begin
  Inc (CurrentPos);
  EOF := (CurrentPos = NumbersList.Strings.Count - 1);
end;

procedure Tmultiple.PagedAdapter1GetFirstRecord(Sender: TObject;
  var EOF: Boolean);
begin
  CurrentPos := 0;
end;

procedure Tmultiple.PagedAdapter1GetEOF(Sender: TObject; var EOF: Boolean);
begin
  EOF := (CurrentPos = NumbersList.Strings.Count);
end;

procedure Tmultiple.PagedAdapter1GetRecordIndex(Sender: TObject;
  var Index: Integer);
begin
  CurrentPos := Index;
end;

procedure Tmultiple.AdapterFieldGetValue(Sender: TObject;
  var Value: Variant);
begin
  Value := NumbersList.Strings.Names [CurrentPos];
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebPageModuleFactory.Create(Tmultiple, TWebPageInfo.Create([wpPublished {, wpLoginRequired}], '.html'), crOnDemand, caCache));

end.
