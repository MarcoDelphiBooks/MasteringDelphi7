unit CgiIntraWm;

interface

uses
  SysUtils, Classes, HTTPApp, HTTPProd, IWProducer,
  IWModuleController, IWApplication, IWPageForm;

type
  TWebModule1 = class(TWebModule)
    IWModuleController1: TIWModuleController;
    IWPageProducer1: TIWPageProducer;
    procedure WebModule1WebActionItem1Action(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure IWPageProducer1GetForm(ASender: TIWPageProducer;
      AWebApplication: TIWApplication; var VForm: TIWPageForm);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WebModule1: TWebModule1;

implementation

{$R *.dfm}

uses
  CgiIntraForm;

procedure TWebModule1.WebModule1WebActionItem1Action(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Response.Content := '<h1>Hello</h1>' +
    '<p>This is a WebBroker page, click ' +
    '<a href="CgiIntra/iwdemo">here</a> for an IntraWeb page</p>';
end;

procedure TWebModule1.IWPageProducer1GetForm(ASender: TIWPageProducer;
  AWebApplication: TIWApplication; var VForm: TIWPageForm);
begin
  VForm := TformMain.Create(AWebApplication);
end;

end.
