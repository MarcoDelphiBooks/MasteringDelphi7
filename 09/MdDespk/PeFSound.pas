unit PeFSound;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls;

type
  TSoundForm = class(TForm)
    Label1: TLabel;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    btnLoad: TSpeedButton;
    OpenDialog1: TOpenDialog;
    btnPlay: TBitBtn;
    ComboBox1: TComboBox;
    procedure btnLoadClick(Sender: TObject);
    procedure btnPlayClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SoundForm: TSoundForm;

implementation

{$R *.DFM}

uses
  MMSystem;

procedure TSoundForm.btnLoadClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
    ComboBox1.Text := OpenDialog1.FileName;
end;

procedure TSoundForm.btnPlayClick(Sender: TObject);
begin
  PlaySound (PChar (ComboBox1.Text), 0, snd_Async);
end;

end.
