unit BatchUpdatesU1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, DB, ADODB, StdCtrls;

type
  TForm1 = class(TForm)
    ADODataSet1: TADODataSet;
    DataSource1: TDataSource;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Button1: TButton;
    CheckBox1: TCheckBox;
    ADOConnection1: TADOConnection;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure CheckBox1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
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
  ADODataSet1.UpdateBatch;
end;

function ADOUpdatesPending(ADODataSet: TCustomADODataSet): boolean;
var
  Clone: TADODataSet;
begin
  Clone:=TADODataSet.Create(nil);
  try
    Clone.Clone(ADODataSet);
    Clone.FilterGroup:=fgPendingRecords;
    Clone.Filtered   :=True;
    Result:=not (Clone.BOF and Clone.EOF);
  finally
    Clone.Free;
  end;
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose:=True;
  if ADOUpdatesPending(ADODataSet1) then
    CanClose:=(MessageDlg('Updates are still pending'+#13#10+
    'Close anyway ?', mtConfirmation, [mbYes, mbNo], 0)=mrYes);
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
  begin
    ADOConnection1.Connected:=True;
    ADODataSet1.Connection:=ADOConnection1;
  end
  else
  begin
    ADODataSet1.Connection:=nil;
    ADOConnection1.Connected:=False;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  ADODataSet1.SaveToFile('Local.ADTG');
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  ADODataSet1.SaveToFile('Local.XML', pfXML);
end;

end.
