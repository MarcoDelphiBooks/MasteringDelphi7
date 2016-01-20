unit IWSimpleAppForm;
{PUBDIST}

interface

uses
  IWAppForm, IWApplication, IWTypes, IWCompListbox, IWCompButton, Classes,
  Controls, IWControl, IWCompEdit;

type
  TformMain = class(TIWAppForm)
    IWEdit1: TIWEdit;
    IWButton1: TIWButton;
    IWListbox1: TIWListbox;
    IWButton2: TIWButton;
    IWButton3: TIWButton;
    procedure IWButton1Click(Sender: TObject);
    procedure IWButton2Click(Sender: TObject);
  public
  end;

implementation
{$R *.dfm}

uses
  ServerController;

procedure TformMain.IWButton1Click(Sender: TObject);
begin
  IWListBox1.Items.Add (IWEdit1.Text);
end;

procedure TformMain.IWButton2Click(Sender: TObject);
var
  nItem: Integer;
begin
  nItem := IWListbox1.ItemIndex;
  if nItem >= 0 then
    WebApplication.ShowMessage (IWListBox1.Items [nItem])
  else
    WebApplication.ShowMessage ('No item selected');
end;

end.