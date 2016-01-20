unit DataWm;

interface

uses
  SysUtils, Classes, HTTPApp, DBClient, Provider, DB, DBTables, WSDLPub,
  SOAPPasInv, SOAPHTTPPasInv, SoapHTTPDisp, WebBrokerSOAP;

type
  TWebModule1 = class(TWebModule)
    HTTPSoapDispatcher1: THTTPSoapDispatcher;
    HTTPSoapPascalInvoker1: THTTPSoapPascalInvoker;
    WSDLHTMLPublish1: TWSDLHTMLPublish;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WebModule1: TWebModule1;

type
  TMyProvider = class (TDatasetProvider)
  public
    constructor Create (AnOwner: TComponent); override;
  end;

implementation

{$R *.DFM}

uses
  InvokeRegistry, Midas, DataRdm;

{ TMyProvider }

constructor TMyProvider.Create(AnOwner: TComponent);
begin
  inherited;
  // initialize
//  WebModule1.Table1.Open;
//  DataSet := WebModule1.Table1;
end;

initialization
  InvRegistry.RegisterInterface(TypeInfo(IAppServer));
  InvRegistry.RegisterInvokableClass (TDataServiceObj);

end.
