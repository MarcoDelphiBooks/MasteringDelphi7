unit UddiInquiryForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Rio, SOAPHTTPClient, StdCtrls, ComCtrls, inquire_v1;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    edSearch: TEdit;
    btnSearch: TButton;
    comboRegistry: TComboBox;
    HTTPRIO1: THTTPRIO;
    ListView1: TListView;
    Memo1: TMemo;
    MemoLog: TMemo;
    procedure btnSearchClick(Sender: TObject);
    procedure ListView1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure HTTPRIO1AfterExecute(const MethodName: String;
      SOAPResponse: TStream);
    procedure HTTPRIO1BeforeExecute(const MethodName: String;
      var SOAPRequest: WideString);
  private
    inftInquire: InquireSoap;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnSearchClick(Sender: TObject);
var
  findBusinessData: Findbusiness;
  businessListData: businessList2;
  i: Integer;
begin
  httprio1.Url := comboRegistry.Text;

  findBusinessData := FindBusiness.Create;
  findBusinessData.name := edSearch.Text;
  findBusinessData.generic := '1.0';
  findBusinessData.maxRows := 20;

  businessListData := inftInquire.find_business(findBusinessData);

  ListView1.Clear;
  for i := 0 to high (businessListData.businessInfos) do
  begin
    with ListView1.Items.Add do
    begin
      Caption := businessListData.businessInfos [i].name;
      SubItems.Add (businessListData.businessInfos [i].description);
      SubItems.Add (businessListData.businessInfos [i].businessKey);
    end;
  end;
  findBusinessData.Free;
end;

procedure TForm1.ListView1DblClick(Sender: TObject);
var
  bk: WideString;
  gbdData: GetBusinessDetail;
begin
  bk := ListView1.Selected.SubItems [1];
  ShowMessage (bk);
  gbdData := GetBusinessDetail.Create;
  gbdData.
  inftInquire.get_businessDetail(gbdData);
  gbdData.Free;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  httprio1.Url := comboRegistry.Text;
  inftInquire := httprio1 as InquireSoap;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  inftInquire := nil;
end;

procedure TForm1.HTTPRIO1AfterExecute(const MethodName: String;
  SOAPResponse: TStream);
var
  StrStream: TStringStream;
begin
  StrStream := TStringStream.Create;
  try
    StrStream.CopyFrom(SOAPResponse, 0);
    MemoLog.Lines.Add ('Received at ' + TimeToStr (now));
    MemoLog.Lines.Add (StrStream.DataString)
  finally
    StrStream.Free;
  end;
end;

procedure TForm1.HTTPRIO1BeforeExecute(const MethodName: String;
  var SOAPRequest: WideString);
begin
  MemoLog.Lines.Add ('Sending at ' + TimeToStr (now));
  MemoLog.Lines.Add (SOAPRequest);
end;

end.

