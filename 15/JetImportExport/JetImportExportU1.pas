unit JetImportExportU1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, ExtCtrls, Grids, DBGrids;

type
  TForm1 = class(TForm)
    ADOConnection1: TADOConnection;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    CurrentFolder: string;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  ADOConnection1.Execute ('SELECT * INTO Customer IN "' +
    CurrentFolder + '" "Paradox 7.x;" FROM CUSTOMER');
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  ADOConnection1.Execute ('SELECT * INTO Customer IN "' +
    CurrentFolder + 'dbdemos.xls" "Excel 8.0;" FROM CUSTOMER');
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  ADOConnection1.Execute ('SELECT * INTO [Customer.htm] IN "' +
    CurrentFolder + '" "HTML Export;" FROM CUSTOMER');
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  ADOTable1.Open;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  CurrentFolder := ExtractFilePath (Application.ExeName);
end;

end.
