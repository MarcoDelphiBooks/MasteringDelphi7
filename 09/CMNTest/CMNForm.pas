unit CMNForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Bevel1: TBevel;
  private
    { Private declarations }
  public
    procedure CMDialogKey(var Msg: TCMDialogKey); message cm_DialogKey;
    procedure CMDialogChar(var Msg: TCMDialogChar); message cm_DialogChar;
    procedure CmFocusChanged (var Msg: TCmFocusChanged); message cm_FocusChanged;
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

{ TForm1 }

procedure TForm1.CMDialogChar(var Msg: TCMDialogChar);
begin
  Label1.Caption := Label1.Caption + Char (Msg.CharCode);
  inherited;
end;

procedure TForm1.CMDialogKey(var Msg: TCMDialogKey);
begin
  if (Msg.CharCode = VK_RETURN) then
  begin
    Perform (CM_DialogKey, VK_TAB, 0);
    Msg.Result := 1;
  end
  else
    inherited;
end;

procedure TForm1.CmFocusChanged(var Msg: TCmFocusChanged);
begin
  Label5.Caption := 'Focus on ' + Msg.Sender.Name;
end;

end.
