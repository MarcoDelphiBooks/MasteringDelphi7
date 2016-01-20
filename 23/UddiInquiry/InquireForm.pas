unit InquireForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Rio, SOAPHTTPClient, StdCtrls, ComCtrls, inquire_v1, OleCtrls,
  SHDocVw, InvokeRegistry;

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
    MemoLog: TMemo;
    btnCategory: TButton;
    edValue: TEdit;
    edKey: TEdit;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    MemoData: TMemo;
    TabSheet4: TTabSheet;
    WebBrowser1: TWebBrowser;
    procedure btnSearchClick(Sender: TObject);
    procedure ListView1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure HTTPRIO1AfterExecute(const MethodName: String;
      SOAPResponse: TStream);
    procedure HTTPRIO1BeforeExecute(const MethodName: String;
      var SOAPRequest: WideString);
    procedure btnCategoryClick(Sender: TObject);
  private
    inftInquire: InquireSoap;
    XmlToMemoData: Boolean;
  public
    { Public declarations }
    procedure businessListToListView (businessList: businessList2);
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnSearchClick(Sender: TObject);
var
  findBusinessData: Findbusiness;
  businessListData: businessList2;
begin
  httprio1.Url := comboRegistry.Text;

  findBusinessData := FindBusiness.Create;
  findBusinessData.name := edSearch.Text;
  findBusinessData.generic := '1.0';
  findBusinessData.maxRows := 20;

  businessListData := inftInquire.find_business(findBusinessData);
  BusinessListToListView (businessListData);

  findBusinessData.Free;
  Beep; // done
end;

procedure TForm1.ListView1DblClick(Sender: TObject);
var
  bk: WideString;
  gbdData: GetBusinessDetail;
  bd: businessDetail;
  bkeys: businessKey;
begin
  bk := ListView1.Selected.SubItems [1];
  // ShowMessage (bk);
  gbdData := GetBusinessDetail.Create;
  SetLength (bkeys, 1);
  bkeys[0] := bk;
  gbdData.businessKey := bkeys;
  gbdData.generic := '1.0';
  XmlToMemoData := system.True;
  bd := inftInquire.get_businessDetail(gbdData);
  // bd to a clientdataset?
  XmlToMemoData := system.False;
  bd.Free;
  gbdData.Free;
  Beep; // done
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
  FileStream: TFileStream;
  pathname: string;
begin
  StrStream := TStringStream.Create ('');;
  try
    StrStream.CopyFrom(SOAPResponse, 0);
    MemoLog.Lines.Add ('======================= Received at ' + TimeToStr (now));
    MemoLog.Lines.Add (StrStream.DataString);

    StrStream.Position := 0;
    if XmlToMemoData then
    begin
      MemoData.Lines.Add(StrStream.DataString);
      StrStream.Position := 0;
      pathname:= ExtractFilePath(Application.ExeName);
      FileStream := TFileStream.Create (pathname + 'company.xml', fmCreate);
      FileStream.CopyFrom(StrStream, strStream.Size);
      FileStream.Free;
      WebBrowser1.Navigate(pathname + 'company.xml');
    end;
  finally
    StrStream.Free;
  end;

end;

procedure TForm1.HTTPRIO1BeforeExecute(const MethodName: String;
  var SOAPRequest: WideString);
begin
  MemoLog.Lines.Add ('======================= Sent at ' + TimeToStr (now));
  MemoLog.Lines.Add (SOAPRequest);
end;

procedure TForm1.businessListToListView(businessList: businessList2);
var
  i: Integer;
begin
  ListView1.Clear;
  for i := 0 to businessList.businessInfos.Len - 1 do
  begin
    with ListView1.Items.Add do
    begin
      Caption := businessList.businessInfos[i].name;
      SubItems.Add (businessList.businessInfos [i].description);
      SubItems.Add (businessList.businessInfos [i].businessKey);
    end;
  end;
end;

procedure TForm1.btnCategoryClick(Sender: TObject);
var
  findBusinessData: Findbusiness;
  businessListData: businessList2;
  catbag: CategoryBag;
  keydRefArray: keyedReference2; // array of KeyedReference;
  kref: keyedReference;
begin
  httprio1.Url := comboRegistry.Text;

  findBusinessData := FindBusiness.Create;
  kref := keyedReference.Create;
  kref.tModelKey := // 'uuid:297AAA47-2DE3-4454-A04A-CF38E889D0C4'; // ucGEOGRAPHY
    'uuid:4E49A8D6-D5A2-4FC2-93A0-0411D8D19E88';

  kref.keyname := edKey.Text;
  kref.keyValue := edValue.Text;

  SetLength (keydRefArray, 1);
  keydRefArray [0] := kref;

  catbag := CategoryBag.Create;

  catbag.keyedReference := keydRefArray;

  findBusinessData.categoryBag := catBag;
  findBusinessData.generic := '1.0';
  findBusinessData.maxRows := 20;

  businessListData := inftInquire.find_business(findBusinessData);
  BusinessListToListView (businessListData);

  findBusinessData.Free;
  Beep; // done
end;

end.

