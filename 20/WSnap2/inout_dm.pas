
unit inout_dm;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, WebModu, HTTPProd,
  WebAdapt, WebComp, CompProd, PagItems, SiteProd, MidItems, WebForm;

type
  Tinout = class(TWebPageModule)
    AdapterPageProducer: TAdapterPageProducer;
    Adapter1: TAdapter;
    Text: TAdapterField;
    AddPlus: TAdapterAction;
    AdapterForm1: TAdapterForm;
    AdapterFieldGroup1: TAdapterFieldGroup;
    AdapterCommandGroup1: TAdapterCommandGroup;
    CmdAddPlus: TAdapterActionButton;
    FldText: TAdapterDisplayField;
    Post: TAdapterAction;
    CmdPost: TAdapterActionButton;
    Auto: TAdapterBooleanField;
    FldAuto: TAdapterDisplayField;
    procedure AddPlusExecute(Sender: TObject; Params: TStrings);
    procedure TextGetValue(Sender: TObject; var Value: Variant);
    procedure PostExecute(Sender: TObject; Params: TStrings);
    procedure Adapter1BeforeExecuteAction(Sender, Action: TObject;
      Params: TStrings; var Handled: Boolean);
    procedure AutoGetValue(Sender: TObject; var Value: Boolean);
  private
    fAuto: Boolean;
    fText: String;
  public
    { Public declarations }
  end;

  function inout: Tinout;

implementation

{$R *.dfm}  {*.html}

uses WebReq, WebCntxt, WebFact, Variants, AdaptReq;

function inout: Tinout;
begin
  Result := Tinout(WebContext.FindModuleClass(Tinout));
end;

procedure Tinout.AddPlusExecute(Sender: TObject; Params: TStrings);
begin
  fText := fText + '+';
end;

procedure Tinout.TextGetValue(Sender: TObject; var Value: Variant);
begin
  Value := fText;
end;

procedure Tinout.PostExecute(Sender: TObject; Params: TStrings);
begin
  if fAuto then
    AddPlusExecute (Self, nil);
end;

procedure Tinout.Adapter1BeforeExecuteAction(Sender, Action: TObject;
  Params: TStrings; var Handled: Boolean);
begin
  if Assigned (Text.ActionValue) then
    fText := Text.ActionValue.Values [0];
  fAuto := Assigned (Auto.ActionValue);
end;

procedure Tinout.AutoGetValue(Sender: TObject; var Value: Boolean);
begin
  Value := fAuto;
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebPageModuleFactory.Create(Tinout, TWebPageInfo.Create([wpPublished {, wpLoginRequired}], '.html'), crOnDemand, caCache));

end.
