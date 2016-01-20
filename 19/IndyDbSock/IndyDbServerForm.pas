unit IndyDbServerForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ScktComp, StdCtrls, Grids, DBGrids, Db, DBTables, ComCtrls, DBClient,
  IdBaseComponent, IdComponent, IdTCPServer;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    lbLog: TListBox;
    cds: TClientDataSet;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    IdTCPServer1: TIdTCPServer;
    cdsCompany: TStringField;
    cdsCompID: TFloatField;
    cdsAddress: TStringField;
    cdsState: TStringField;
    cdsCountry: TStringField;
    cdsEmail: TStringField;
    cdsContact: TStringField;
    cdsLoggedBy: TStringField;
    cdsLoggedOn: TDateField;
    procedure FormCreate(Sender: TObject);
    procedure IdTCPServer1TIdCommandHandler0Command(ASender: TIdCommand);
    procedure IdTCPServer1Connect(AThread: TIdPeerThread);
    procedure IdTCPServer1Disconnect(AThread: TIdPeerThread);
  private
    { Private declarations }
  end;

var
  Form1: TForm1;

implementation

var
  ID: Integer;

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin
  IdTCPServer1.Active := True;
  // create the table, if it doesn't exist
  if not FileExists (cds.FileName) then
    cds.CreateDataSet;
  cds.Active := True;
  cds.LogChanges := False; // don't use delta
end;

procedure TForm1.IdTCPServer1TIdCommandHandler0Command(
  ASender: TIdCommand);
var
  Data: TStrings;
  I: Integer;
begin
  Data := TStringList.Create;
  try
    ASender.Thread.Connection.ReadStrings(Data);
    cds.Insert;
    // set the fields using the strings
    for I := 0 to cds.FieldCount - 1 do
      cds.Fields [I].AsString :=
        Data.Values [cds.Fields[I].FieldName];
    // complete with ID, sender, and date
    Inc(ID);
    cdsCompID.AsInteger := ID;
    cdsLoggedBy.AsString := ASender.Thread.Connection.Socket.Binding.PeerIP;
    cdsLoggedOn.AsDateTime := Date;
    cds.Post;
    // return the ID
    ASender.Thread.Connection.WriteLn(cdsCompID.AsString);
  finally
    Data.Free;
  end;
end;

procedure TForm1.IdTCPServer1Connect(AThread: TIdPeerThread);
begin
  lbLog.Items.Add ('Connected from: ' +
    AThread.Connection.Socket.Binding.PeerIP);
end;

procedure TForm1.IdTCPServer1Disconnect(AThread: TIdPeerThread);
begin
  lbLog.Items.Add ('Diconnected from: ' +
    AThread.Connection.Socket.Binding.PeerIP);
end;

initialization
  // Setup first ID for this session
  ID := GetTickCount;

end.
