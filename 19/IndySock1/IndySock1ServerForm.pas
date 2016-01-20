unit IndySock1ServerForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IdBaseComponent, IdComponent, IdTCPServer, StdCtrls, HTTPApp;

type
  TFormServer = class(TForm)
    IdTCPServer1: TIdTCPServer;
    lbLog: TListBox;
    procedure IdTCPServer1TIdCommandHandler1Command(ASender: TIdCommand);
    procedure FormCreate(Sender: TObject);
    procedure IdTCPServer1Connect(AThread: TIdPeerThread);
    procedure IdTCPServer1Disconnect(AThread: TIdPeerThread);
    procedure IdTCPServer1TIdCommandHandler2Command(ASender: TIdCommand);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormServer: TFormServer;

implementation

{$R *.dfm}

procedure TFormServer.IdTCPServer1TIdCommandHandler1Command(
  ASender: TIdCommand);
begin
  ASender.Thread.Connection.Writeln ('This is a dynamic response');
end;

procedure TFormServer.FormCreate(Sender: TObject);
begin
  IdTCPServer1.Active := True;
end;

procedure TFormServer.IdTCPServer1Connect(AThread: TIdPeerThread);
begin
  lbLog.Items.Add ('Connected from: ' +
    AThread.Connection.Socket.Binding.PeerIP);
end;

procedure TFormServer.IdTCPServer1Disconnect(AThread: TIdPeerThread);
begin
  lbLog.Items.Add ('Disconnected from: ' +
    AThread.Connection.Socket.Binding.PeerIP);
end;

procedure TFormServer.IdTCPServer1TIdCommandHandler2Command(
  ASender: TIdCommand);
var
  filename: string;
  fstream: TFileStream;
begin
  if Assigned (ASender.Params) then
    filename := HttpDecode (ASender.Params[0]);
  if not FileExists (filename) then
  begin
    ASender.Response.Text := 'File not found';
    lbLog.Items.Add ('File not found: ' + filename);
    raise EIdTCPServerError.Create ('File not found: ' + filename);
  end
  else
  begin
    fstream := TFileStream.Create (filename, fmOpenRead);
    try
      ASender.Thread.Connection.WriteStream(fstream, True, True);
      // fStream.Size;
      lbLog.Items.Add ('File returned: ' + filename +
        ' (' + IntToStr (fStream.Size) + ')');
    finally
      fstream.Free;
    end;
  end;
end;

end.
