unit ClientForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, xmldom, Grids, DBGrids, DB, Provider, Xmlxform,
  DBClient;

type
  TForm1 = class(TForm)
    btnGetList: TButton;
    btnGetDetails: TButton;
    Memo2: TMemo;
    ClientDataSet1: TClientDataSet;
    XMLTransformProvider1: TXMLTransformProvider;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    procedure btnGetListClick(Sender: TObject);
    procedure btnGetDetailsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  ISoapEmployee1;

procedure TForm1.btnGetListClick(Sender: TObject);
var
  strXml: string;
begin
  strXml := GetISoapEmployee.GetEmployeeNames;

  // temporary code to save the XML in a file for the mapper
  // Memo2.Lines.Text := strXml

  strXML := XMLTransformProvider1.TransformRead.TransformXML(strXml);
  ClientDataSet1.XmlData := strXml;
  ClientDataSet1.Open;
end;

procedure TForm1.btnGetDetailsClick(Sender: TObject);
begin
  Memo2.Lines.Text := GetISoapEmployee.GetEmployeeData(
    ClientDataSet1.FieldByName ('id').AsString);
end;

end.
