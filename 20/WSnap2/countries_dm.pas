
unit countries_dm;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, WebModu, HTTPProd,
  DBTables, DB, DBWeb, DBClient;

type
  Tcountries = class(TWebPageModule)
    DataSetTableProducer1: TDataSetTableProducer;
    PageProducer: TPageProducer;
    cdsCountry: TClientDataSet;
    procedure WebPageModuleBeforeDispatchPage(Sender: TObject;
      const PageName: String; var Handled: Boolean);
    procedure PageProducerHTMLTag(Sender: TObject; Tag: TTag;
      const TagString: String; TagParams: TStrings;
      var ReplaceText: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function countries: Tcountries;

implementation

{$R *.dfm}  {*.html}

uses WebReq, WebCntxt, WebFact, Variants, country_dm;

function countries: Tcountries;
begin
  Result := Tcountries(WebContext.FindModuleClass(Tcountries));
end;

procedure Tcountries.WebPageModuleBeforeDispatchPage(Sender: TObject;
  const PageName: String; var Handled: Boolean);
begin
  cdsCountry.Open;
  cdsCountry.First;
end;

procedure Tcountries.PageProducerHTMLTag(Sender: TObject; Tag: TTag;
  const TagString: String; TagParams: TStrings; var ReplaceText: String);
begin
  if TagString = 'htmltable' then
    ReplaceText := DataSetTableProducer1.Content;
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebPageModuleFactory.Create(Tcountries, TWebPageInfo.Create([wpPublished {, wpLoginRequired}], '.html'), crOnDemand, caCache));

end.
