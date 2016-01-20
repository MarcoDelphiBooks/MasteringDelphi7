unit ListD;

interface

uses Windows, Classes, Graphics, Forms,
  Controls, Buttons, StdCtrls;

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

{$R *.DFM}

end.

