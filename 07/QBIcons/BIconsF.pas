unit BIconsF;

interface

uses
  SysUtils, Qt, Classes, QGraphics, QControls,
  QForms, QDialogs, QMenus, QStdCtrls, QTypes;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    BorderIcons1: TMenuItem;
    SystemMenu1: TMenuItem;
    MinimizeBox1: TMenuItem;
    MaximizeBox1: TMenuItem;
    Help1: TMenuItem;
    btnHelp: TButton;
    procedure SetIcons(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
    function FormHelp(HelpType: THelpType; HelpContext: THelpContext;
      const HelpKeyword, HelpFile: String; var Handled: Boolean): Boolean;
  private
    { Private declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.xfm}

procedure TForm1.SetIcons(Sender: TObject);
var
  BorIco: TBorderIcons;
begin
  (Sender as TMenuItem).Checked :=
    not (Sender as TMenuItem).Checked;
  if SystemMenu1.Checked then
    BorIco := [biSystemMenu]
  else
    BorIco := [];
  if MaximizeBox1.Checked then
    Include (BorIco, biMaximize);
  if MinimizeBox1.Checked then
    Include (BorIco, biMinimize);
  if Help1.Checked then
    Include (BorIco, biHelp);
  BorderIcons := BorIco;
end;

procedure TForm1.btnHelpClick(Sender: TObject);
begin
  BorderIcons := [biSystemMenu, biHelp];
  SystemMenu1.Checked := True;
  MinimizeBox1.Checked := False;
  MaximizeBox1.Checked := False;
  Help1.Checked := True;
end;

function TForm1.FormHelp(HelpType: THelpType; HelpContext: THelpContext;
  const HelpKeyword, HelpFile: String; var Handled: Boolean): Boolean;
begin
  Caption := 'Help requested at ' + TimeToStr (now);
  Result := False;
end;

end.
