unit IWSessionForm;
{PUBDIST}

interface

uses
  IWAppForm, IWApplication, IWTypes, IWCompLabel, Classes, Controls,
  IWControl, IWCompButton, SysUtils, IWExtCtrls, IWCompCheckbox;

type
  TformMain = class(TIWAppForm)
    IWButton1: TIWButton;
    IWLabel1: TIWLabel;
    IWLabel2: TIWLabel;
    IWLabel3: TIWLabel;
    IWTimer1: TIWTimer;
    IWCheckBox1: TIWCheckBox;
    procedure IWButton1Click(Sender: TObject);
    procedure IWTimer1Timer(Sender: TObject);
    procedure IWCheckBox1Click(Sender: TObject);
  private
    FormCount: Integer;
  end;

implementation
{$R *.dfm}

uses
  ServerController, Windows;

var
  GlobalCount: Integer;

procedure TformMain.IWButton1Click(Sender: TObject);
begin
  InterlockedIncrement (GlobalCount);
  Inc (FormCount);
  Inc (UserSession.UserCount);

  IWLabel1.Text := 'Global: ' + IntToStr (GlobalCount);
  IWLabel2.Text := 'Form: ' + IntToStr (FormCount);
  IWLabel3.Text := 'User: ' + IntToStr (UserSession.UserCount);
end;

procedure TformMain.IWTimer1Timer(Sender: TObject);
begin
  IWButton1Click (Sender);
end;

procedure TformMain.IWCheckBox1Click(Sender: TObject);
begin
  IWTimer1.Enabled := IWCheckBox1.Checked;
end;

end.