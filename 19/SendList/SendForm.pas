unit SendForm;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, Menus,
  StdCtrls, Dialogs, Buttons, Messages, ExtCtrls, ComCtrls,
  IdComponent, IdTCPConnection, IdTCPClient,
  IdMessageClient, IdSMTP, IdBaseComponent, IdMessage;

type
  TMainForm = class(TForm)
    Panel2: TPanel;
    reMessageText: TRichEdit;
    Panel1: TPanel;
    Label1: TLabel;
    eName: TEdit;
    Splitter1: TSplitter;
    ListLog: TListBox;
    Label2: TLabel;
    eSubject: TEdit;
    Label3: TLabel;
    BbtnAddToList: TButton;
    ListAddr: TListBox;
    BtnRemove: TButton;
    BtnFind: TButton;
    Label5: TLabel;
    eFrom: TEdit;
    BtnSendAll: TButton;
    eServer: TEdit;
    MailMessage: TIdMessage;
    Mail: TIdSMTP;
    Label4: TLabel;
    Label6: TLabel;
    eUserName: TEdit;
    Password: TLabel;
    ePassword: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnSendAllClick(Sender: TObject);
    procedure BbtnAddToListClick(Sender: TObject);
    procedure BtnRemoveClick(Sender: TObject);
    procedure BtnFindClick(Sender: TObject);
    procedure MailConnected(Sender: TObject);
    procedure MailDisconnected(Sender: TObject);
    procedure MailStatus(axSender: TObject; const axStatus: TIdStatus;
      const asStatusText: String);
    procedure MailWorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCountMax: Integer);
    procedure MailWorkEnd(Sender: TObject; AWorkMode: TWorkMode);
  private
    FileName: string;
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  // load the list of addresses
  FileName := ChangeFileExt (Application.ExeName, '.txt');
  ListAddr.Items.LoadFromFile (FileName);
  ListLog.Items.Add ('Addresses: ' + IntToStr (
    ListAddr.Items.Count));
  // select the first item
  ListAddr.ItemIndex := 0;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // save the list of addresses
  ListAddr.Items.SaveToFile (FileName);
end;

const
  BccInMsg = 30;

procedure TMainForm.BtnSendAllClick(Sender: TObject);
var
  nItem: Integer;
  Res: Word;
begin
  Res := MessageDlg ('Start sending from item ' +
      IntToStr (ListAddr.ItemIndex) + ' (' +
      ListAddr.Items [ListAddr.ItemIndex] + ')?'#13 +
      '(No starts form 0)',
      mtConfirmation,
      [mbYes, mbNo, mbCancel], 0);
  if Res = mrCancel then
    Exit;
  if Res = mrYes then
    nItem := ListAddr.ItemIndex
  else
    nItem := 0;

  // connect
  Mail.Host := eServer.Text;
  Mail.Username := eUserName.Text;
  if ePassword.Text <> '' then
  begin
    Mail.Password := ePassword.Text;
    Mail.AuthenticationType := atLogin;
  end;
  Mail.Connect;

  // send the messages, one by one, prepending a custom message
  try
    // set the fixed part of the header
    MailMessage.From.Name := eFrom.Text;
    MailMessage.Subject := eSubject.Text;
    MailMessage.Body.SetText (
      reMessageText.Lines.GetText);
    MailMessage.Body.Insert (0, 'Hello');

    while nItem < ListAddr.Items.Count do
    begin
      // show the current selection
      Application.ProcessMessages;
      ListAddr.ItemIndex := nItem;
      MailMessage.Body [0] := 'Hello ' + ListAddr.Items [nItem];
      MailMessage.Recipients.EMailAddresses := ListAddr.Items [nItem];
      Mail.Send(MailMessage);
      Inc (nItem);
    end;
  finally // we're done
    Mail.Disconnect;
  end;
end;

procedure TMainForm.BbtnAddToListClick(Sender: TObject);
begin
  ListAddr.ItemIndex :=
    ListAddr.Items.Add (eName.Text);
end;

procedure TMainForm.BtnRemoveClick(Sender: TObject);
begin
  // copy the item to the name edit box and remove it
  eName.Text := ListAddr.Items [ListAddr.ItemIndex];
  ListAddr.Items.Delete (ListAddr.ItemIndex);
end;

procedure TMainForm.BtnFindClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to ListAddr.Items.Count - 1 do
    if Pos (eName.Text, ListAddr.Items [I]) > 0 then
    begin
      ListAddr.ItemIndex := I;
      Break;
    end;
  Beep;
end;

procedure TMainForm.MailConnected(Sender: TObject);
begin
  ListLog.Items.Add ('Connected to host');
end;

procedure TMainForm.MailDisconnected(Sender: TObject);
begin
  ListLog.Items.Add ('Disconnected from host');
end;

procedure TMainForm.MailStatus(axSender: TObject;
  const axStatus: TIdStatus; const asStatusText: String);
begin
  ListLog.Items.Add (asStatusText);
end;

procedure TMainForm.MailWorkBegin(Sender: TObject; AWorkMode: TWorkMode;
  const AWorkCountMax: Integer);
begin
  ListLog.Items.Add ('Sending to: ' +
    MailMessage.Recipients.EMailAddresses);
end;

procedure TMainForm.MailWorkEnd(Sender: TObject; AWorkMode: TWorkMode);
begin
  ListLog.Items.Add ('Done');
end;

end.
