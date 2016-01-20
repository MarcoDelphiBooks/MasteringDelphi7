unit MBForm;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls, Spin, Buttons;

type
  TForm1 = class(TForm)
    ButtonMessageDlg: TButton;
    ButtonShowMessage: TButton;
    ButtonShowMessagePos: TButton;
    GroupBox1: TGroupBox;
    RadioWarning: TRadioButton;
    RadioError: TRadioButton;
    RadioInformation: TRadioButton;
    RadioConfirmation: TRadioButton;
    Bevel1: TBevel;
    Edit1: TEdit;
    Label1: TLabel;
    RadioCustom: TRadioButton;
    GroupBox2: TGroupBox;
    RadioOK: TRadioButton;
    RadioOKCancel: TRadioButton;
    RadioYesNo: TRadioButton;
    RadioYesNoCancel: TRadioButton;
    CheckHelp: TCheckBox;
    ButtonMsgDlgPos: TButton;
    SpinY: TSpinEdit;
    SpinX: TSpinEdit;
    Label2: TLabel;
    Label3: TLabel;
    ButtonInputBox: TButton;
    ButtonInputQuery: TButton;
    Bevel2: TBevel;
    EditCaption: TEdit;
    EditPrompt: TEdit;
    EditValue: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    ButtonQuit: TButton;
    procedure ButtonMessageDlgClick(Sender: TObject);
    procedure RadioWarningClick(Sender: TObject);
    procedure RadioErrorClick(Sender: TObject);
    procedure RadioInformationClick(Sender: TObject);
    procedure RadioConfirmationClick(Sender: TObject);
    procedure RadioCustomClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RadioOKClick(Sender: TObject);
    procedure RadioOKCancelClick(Sender: TObject);
    procedure RadioYesNoClick(Sender: TObject);
    procedure RadioYesNoCancelClick(Sender: TObject);
    procedure ButtonMsgDlgPosClick(Sender: TObject);
    procedure ButtonShowMessageClick(Sender: TObject);
    procedure ButtonShowMessagePosClick(Sender: TObject);
    procedure ButtonInputBoxClick(Sender: TObject);
    procedure ButtonInputQueryClick(Sender: TObject);
    procedure ButtonQuitClick(Sender: TObject);
  private
    { Private declarations }
    MsgDlgType: TMsgDlgType;
    MsgButtons: TMsgDlgButtons;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin
  MsgDlgType := mtWarning;
  MsgButtons := [mbOk];
end;

procedure TForm1.ButtonMessageDlgClick(Sender: TObject);
begin
  if CheckHelp.Checked then
    Include (MsgButtons, mbHelp);
  MessageDlg (Edit1.Text, MsgDlgType, MsgButtons, 0);
end;

procedure TForm1.RadioWarningClick(Sender: TObject);
begin
  MsgDlgType := mtWarning;
end;

procedure TForm1.RadioErrorClick(Sender: TObject);
begin
  MsgDlgType := mtError;
end;

procedure TForm1.RadioInformationClick(Sender: TObject);
begin
  MsgDlgType := mtInformation;
end;

procedure TForm1.RadioConfirmationClick(Sender: TObject);
begin
  MsgDlgType := mtConfirmation;
end;

procedure TForm1.RadioCustomClick(Sender: TObject);
begin
  MsgDlgType := mtCustom;
end;

procedure TForm1.RadioOKClick(Sender: TObject);
begin
  MsgButtons := [mbOk];
end;

procedure TForm1.RadioOKCancelClick(Sender: TObject);
begin
  MsgButtons := mbOkCancel;
end;

procedure TForm1.RadioYesNoClick(Sender: TObject);
begin
  MsgButtons := [mbYes, mbNo];
end;

procedure TForm1.RadioYesNoCancelClick(Sender: TObject);
begin
    MsgButtons := mbYesNoCancel;
end;

procedure TForm1.ButtonMsgDlgPosClick(Sender: TObject);
begin
  if CheckHelp.Checked then
    Include (MsgButtons, mbHelp);
  MessageDlgPos (Edit1.Text, MsgDlgType, MsgButtons,
    0, SpinX.Value, SpinY.Value);
end;

procedure TForm1.ButtonShowMessageClick(Sender: TObject);
begin
  ShowMessage (Edit1.Text);
end;

procedure TForm1.ButtonShowMessagePosClick(Sender: TObject);
begin
  ShowMessagePos (Edit1.Text, SpinX.Value, SpinY.Value);
end;

procedure TForm1.ButtonInputBoxClick(Sender: TObject);
begin
  EditValue.Text := InputBox (EditCaption.Text,
    EditPrompt.Text, EditValue.Text);
end;

procedure TForm1.ButtonInputQueryClick(Sender: TObject);
var
  Text: String;
begin
  Text := EditValue.Text;
  if InputQuery (EditCaption.Text, EditPrompt.Text, Text) then
    EditValue.Text := Text;
end;

procedure TForm1.ButtonQuitClick(Sender: TObject);
begin
  Close;
end;

end.
