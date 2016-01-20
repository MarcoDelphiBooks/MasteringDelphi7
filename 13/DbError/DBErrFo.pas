unit DBErrFo;

interface

uses
  Windows, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, DB, DBTables, StdCtrls, AppEvnts, DBClient;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Label1: TLabel;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    cds: TClientDataSet;
    ApplicationEvents1: TApplicationEvents;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
  private
    { Private declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  cds.FieldByName ('Name').Value := 'something';
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  S: String;
begin
  s := cds.FieldByName ('Name').Value;
  cds.Insert;
  cds.FieldByName ('Name').Value := s;
  cds.Post;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  cds.Open;
end;

procedure TForm1.ApplicationEvents1Exception(Sender: TObject;
  E: Exception);
begin
  if E is EDbClient then
  begin
    Memo1.Lines.Add('Error: ' + (E.Message));
    Memo1.Lines.Add('   Error Code: ' +
      IntToStr(EDbClient (E).ErrorCode));
  end
  else
    Memo1.Lines.Add('Generic Error: ' + (E.Message));
end;

end.
