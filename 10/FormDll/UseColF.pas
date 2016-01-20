unit UseColF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    BtnChange: TButton;
    BtnSelect: TButton;
    BtnApp: TButton;
    BtnSync: TButton;
    procedure BtnChangeClick(Sender: TObject);
    procedure BtnSelectClick(Sender: TObject);
    procedure BtnAppClick(Sender: TObject);
    procedure BtnSyncClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure UserMessage (var Msg: TMessage);
      message wm_user;
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

function GetColor (Col: LongInt): LongInt;
  stdcall; external 'FormDLL.DLL';
procedure ShowColor (Col: LongInt;
  FormHandle: THandle; MsgBack: Integer);
  stdcall; external 'FormDLL.DLL';
procedure SyncApp (AppHandle: THandle);
  stdcall; external 'FormDLL.DLL';

procedure TForm1.BtnChangeClick(Sender: TObject);
var
  Col: LongInt;
begin
  Col := ColorToRGB (Color);
  Color := GetColor (Col)
end;

procedure TForm1.BtnSelectClick(Sender: TObject);
var
  Col: LongInt;
begin
  Col := ColorToRGB (Color);
  ShowColor (Col, Handle, wm_user);
end;

procedure TForm1.UserMessage(var Msg: TMessage);
begin
  Color := Msg.WParam;
end;

procedure TForm1.BtnAppClick(Sender: TObject);
begin
  ShowMessage ('Application Handle: ' +
    IntToStr (Application.Handle));
end;

procedure TForm1.BtnSyncClick(Sender: TObject);
begin
  SyncApp (Application.Handle);
  BtnSync.Enabled := False;
end;

end.
