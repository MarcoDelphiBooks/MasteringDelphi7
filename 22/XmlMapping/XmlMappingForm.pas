unit XmlMappingForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, xmldom, StdCtrls, ExtCtrls, DBCtrls, Mask, DB, Grids, DBGrids,
  DBClient, Provider, Xmlxform;

type
  TForm1 = class(TForm)
    XMLTransformProvider1: TXMLTransformProvider;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    ClientDataSet1text: TStringField;
    ClientDataSet1book: TDataSetField;
    ClientDataSet1ebook: TDataSetField;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Panel1: TPanel;
    DBNavigator1: TDBNavigator;
    Splitter1: TSplitter;
    DBGrid2: TDBGrid;
    ClientDataSet2: TClientDataSet;
    ClientDataSet3: TClientDataSet;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
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

procedure TForm1.Button1Click(Sender: TObject);
begin
  ClientDataSet1.ApplyUpdates (-1);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ClientDataSet1.Open;
end;

end.
