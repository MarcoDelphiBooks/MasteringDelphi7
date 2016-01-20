unit ListD;

interface

uses Qt, Classes, QGraphics, QForms,
  QControls, QButtons, QStdCtrls;

type
  TListDial = class(TForm)
    ListBox1: TListBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ListDial: TListDial;

implementation

{$R *.xfm}

end.

