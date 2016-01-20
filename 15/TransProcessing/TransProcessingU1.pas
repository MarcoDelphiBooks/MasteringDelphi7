unit TransProcessingU1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, Grids, DBGrids, ExtCtrls;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    ADOConnection1: TADOConnection;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
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
  ADOConnection1.BeginTrans;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  ADOConnection1.CommitTrans;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  ADOConnection1.RollbackTrans;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ADOTable1.Open;
end;

end.
