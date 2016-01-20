unit IndyDbClientForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, ExtCtrls, Db, Mask, DBTables, ScktComp, DBClient;

type
  TForm1 = class(TForm)
    EditServer: TEdit;
    Server: TLabel;
    cds: TClientDataSet;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    DBNavigator1: TDBNavigator;
    DBText1: TDBText;
    lbLog: TListBox;
    btnDelete: TButton;
    Label8: TLabel;
    Bevel1: TBevel;
    btnSend: TButton;
    cdsCompany: TStringField;
    cdsCompID: TFloatField;
    cdsAddress: TStringField;
    cdsState: TStringField;
    cdsCountry: TStringField;
    cdsEmail: TStringField;
    cdsContact: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnSendClick(Sender: TObject);
  private
    procedure OnLog(Sender: TObject; LogMsg: String);
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

uses
  IndyDbClientThread;

procedure TForm1.FormCreate(Sender: TObject);
begin
  // create it if it doesn't exist
  if not FileExists (cds.FileName) then
    cds.CreateDataSet;
  cds.Active := True;
  cds.LogChanges := False; // don't use delta
end;

procedure TForm1.btnDeleteClick(Sender: TObject);
begin
  cds.First;
  while not cds.Eof do
  begin
    // if the record is still logged
    if not cdsCompID.IsNull and (cdsCompID.AsInteger <> 0) then
      cds.Delete
    else
      cds.Next;
  end;
end;

procedure TForm1.btnSendClick(Sender: TObject);
var
  SendThread: TSendThread;
begin
  SendThread := TSendThread.Create(cds);
  SendThread.OnLog := OnLog;
  SendThread.ServerAddress := EditServer.Text;
  SendThread.Resume;
end;

procedure TForm1.OnLog(Sender: TObject; LogMsg: String);
begin
  lbLog.Items.Add(LogMsg);
end;

end.
