
unit date_dm;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, WebModu, HTTPProd, DSProd,
  DBTables, DB, DBClient;

type
  Tcountry = class(TWebPageModule)
    DataSetPageProducer: TDataSetPageProducer;
    cdsCountry: TClientDataSet;
    procedure WebPageModuleBeforeDispatchPage(Sender: TObject;
      const PageName: String; var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function country: Tcountry;

implementation

{$R *.dfm}  {*.html}

uses WebReq, WebCntxt, WebFact, Variants;

function country: Tcountry;
begin
  Result := Tcountry(WebContext.FindModuleClass(Tcountry));
end;

procedure Tcountry.WebPageModuleBeforeDispatchPage(Sender: TObject;
  const PageName: String; var Handled: Boolean);
begin
  cdsCountry.Open;
  cdsCountry.First;
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebPageModuleFactory.Create(Tcountry, TWebPageInfo.Create([wpPublished {, wpLoginRequired}], '.html'), crOnDemand, caCache));

end.
