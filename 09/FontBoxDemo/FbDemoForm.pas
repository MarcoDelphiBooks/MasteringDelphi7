unit FbDemoForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, MdFontCombo;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Memo1: TMemo;
    MdFontCombo1: TMdFontCombo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

end.

   