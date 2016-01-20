unit main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Db, Grids, DBGrids, DBClient, SimpleDS, DBXpress;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    grpIsolation: TRadioGroup;
    grpTransaction: TGroupBox;
    btnRollback: TButton;
    btnStart: TButton;
    btnCommit: TButton;
    SimpleDataset1: TSimpleDataset;
    Button1: TButton;
    Button2: TButton;
    procedure btnStartClick(Sender: TObject);
    procedure btnCommitClick(Sender: TObject);
    procedure btnRollbackClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    TransDesc: TTransactionDesc;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.btnStartClick(Sender: TObject);
begin
  if not SimpleDataSet1.Connection.InTransaction then
  begin
    TransDesc.TransactionID := GetTickCount;
    case grpIsolation.ItemIndex of
      0: TransDesc.IsolationLevel := xilDIRTYREAD;
      1: TransDesc.IsolationLevel := xilREADCOMMITTED;
      2: TransDesc.IsolationLevel := xilREPEATABLEREAD;
    end;
    SimpleDataSet1.Connection.StartTransaction(TransDesc);
    SimpleDataSet1.Open;
    btnStart.Enabled := False;
    btnCommit.Enabled := True;
    btnRollback.Enabled := True;
  end;
end;

procedure TForm1.btnCommitClick(Sender: TObject);
begin
  SimpleDataSet1.Connection.Commit (TransDesc);
  SimpleDataSet1.Close;
  btnStart.Enabled := True;
  btnCommit.Enabled := False;
  btnRollback.Enabled := False;
end;

procedure TForm1.btnRollbackClick(Sender: TObject);
begin
  SimpleDataSet1.Connection.Rollback (TransDesc);
  SimpleDataSet1.Close;
  btnStart.Enabled := True;
  btnCommit.Enabled := False;
  btnRollback.Enabled := False;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  SimpleDataset1.ApplyUpdates(-1);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  SimpleDataset1.Refresh;
end;

end.
