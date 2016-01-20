unit IndySock1ClientForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  StdCtrls, ExtCtrls, IdAntiFreezeBase, IdAntiFreeze, HttpApp;

type
  TFormClient = class(TForm)
    IdTCPClient1: TIdTCPClient;
    btnTest: TButton;
    btnExecute: TButton;
    btnConnect: TButton;
    btnDisconnect: TButton;
    Bevel1: TBevel;
    btnGetFile: TButton;
    edFileName: TEdit;
    Image1: TImage;
    Bevel2: TBevel;
    procedure btnTestClick(Sender: TObject);
    procedure btnConnectClick(Sender: TObject);
    procedure btnDisconnectClick(Sender: TObject);
    procedure btnExecuteClick(Sender: TObject);
    procedure btnGetFileClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormClient: TFormClient;

implementation

{$R *.dfm}

procedure TFormClient.btnTestClick(Sender: TObject);
begin
  IdTCPClient1.SendCmd ('test');
  ShowMessage (IdTCPClient1.LastCmdResult.TextCode + ' : ' +
    IdTCPClient1.LastCmdResult.Text.Text);
end;

procedure TFormClient.btnConnectClick(Sender: TObject);
begin
  IdTCPClient1.Connect;
end;

procedure TFormClient.btnDisconnectClick(Sender: TObject);
begin
  IdTCPClient1.Disconnect;
end;

procedure TFormClient.btnExecuteClick(Sender: TObject);
begin
  IdTCPClient1.WriteLn('execute');
  ShowMessage (IdTCPClient1.ReadLn);
end;

procedure TFormClient.btnGetFileClick(Sender: TObject);
var
  stream: TStream;
begin
  IdTCPClient1.WriteLn('getfile ' + HttpEncode (edFileName.Text));
  stream := TMemoryStream.Create;
  try
    IdTCPClient1.ReadStream(stream);
    stream.Position := 0;
    Image1.Picture.Bitmap.LoadFromStream (stream);
  finally
    stream.Free;
  end;
end;

end.
