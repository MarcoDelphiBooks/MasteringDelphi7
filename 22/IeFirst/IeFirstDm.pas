unit IeFirstDm;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, MidItems, Db, DBClient,
  MConnect, SConnect, CompProd, PagItems, MidProd, XMLBrokr, HTTPProd,
  WebComp, DBXpress, FMTBcd, Provider, SqlExpr, SimpleDS;

type
  TWebModule1 = class(TWebModule)
    XMLBroker1: TXMLBroker;
    PageProducer1: TPageProducer;
    DataSetProvider1: TDataSetProvider;
    InetXPageProducer1: TInetXPageProducer;
    DataForm1: TDataForm;
    DataNavigator1: TDataNavigator;
    DataGrid1: TDataGrid;
    EmpNo: TTextColumn;
    LastName: TTextColumn;
    FirstName: TTextColumn;
    PhoneExt: TTextColumn;
    HireDate: TTextColumn;
    Salary: TTextColumn;
    StatusColumn1: TStatusColumn;
    ClientDataSet1: TClientDataSet;
    procedure XMLBroker1GetResponse(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WebModule1: TWebModule1;

implementation

{$R *.DFM}

procedure TWebModule1.XMLBroker1GetResponse(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Response.Content := '<h1>Updated</h1><p>' + InetXPageProducer1.Content;
  Handled := True;
end;

end.
