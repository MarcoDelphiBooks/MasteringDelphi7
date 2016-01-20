unit MapTblForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, xmldom, StdCtrls, Grids, DBGrids, Xmlxform,
  DBClient, Provider, XMLDoc, ComCtrls, SimpleDS;

type
  TForm1 = class(TForm)
    DataSetProvider1: TDataSetProvider;
    XMLTransformClient1: TXMLTransformClient;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    btnMap: TButton;
    Memo1: TMemo;
    SimpleDataSet1: TSimpleDataSet;
    procedure btnMapClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnMapClick(Sender: TObject);
begin
  Memo1.Lines.Text := FormatXmlData (XMLTransformClient1.GetDataAsXml(''));
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  SimpleDataSet1.Active := True;
end;

end.
