unit CgiIntraForm;
{PUBDIST}

interface

uses
  IWApplication, IWTypes, IWPageForm, Classes, Controls, IWControl,
  IWCompButton, IWLayoutMgr, IWTemplateProcessorHTML, IWCompListbox,
  IWCompLabel, IWLayoutMgrHTML;

type
  TformMain = class(TIWPageForm)
    IWButton1: TIWButton;
    IWLayoutMgrHTML1: TIWLayoutMgrHTML;
    IWLabel1: TIWLabel;
    IWComboBox1: TIWComboBox;
    procedure IWButton1Click(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

procedure TformMain.IWButton1Click(Sender: TObject);
begin
  IWLabel1.Caption := 'This is a test';
end;

end.
