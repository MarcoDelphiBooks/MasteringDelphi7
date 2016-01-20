unit SoapDataForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, SoapConn, Grids, DBGrids, StdCtrls,
  Rio, SoapHTTPClient, InvokeRegistry;

type
  TFormSDC = class(TForm)
    SoapConnection1: TSoapConnection;
    ClientDataSet1: TClientDataSet;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    HTTPRIO1: THTTPRIO;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSDC: TFormSDC;

implementation

{$R *.dfm}

uses
  ISampleDataModule1;

procedure TFormSDC.Button1Click(Sender: TObject);
begin
  ClientDataSet1.Open;
end;

procedure TFormSDC.Button2Click(Sender: TObject);
begin
  ClientDataSet1.ApplyUpdates (-1);
end;

procedure TFormSDC.Button3Click(Sender: TObject);
var
  SoapData: ISampleDataModule;
begin
  SoapData := HttpRio1 as ISampleDataModule;
  ShowMessage (IntToStr (SoapData.GetRecordCount));
end;

end.
