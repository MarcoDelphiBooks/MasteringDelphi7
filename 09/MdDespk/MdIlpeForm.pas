unit MdIlpeForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TIntListPEForm = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Memo1: TMemo;
    BitBtn3: TBitBtn;
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

{var
  IntListPEForm: TIntListPEForm;}

implementation

{$R *.DFM}

procedure TIntListPEForm.BitBtn3Click(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to 9 do
    Memo1.Lines [I] := IntToStr (I * 100);
end;

end.
