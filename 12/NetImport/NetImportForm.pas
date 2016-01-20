unit NetImportForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    btnAdd: TButton;
    procedure btnAddClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  NetLibrary_TLB;

procedure TForm1.btnAddClick(Sender: TObject);
var
  num: INumber;
begin
  num := CoTNumber.Create as INumber;
  num.Increase;
  ShowMessage (IntToStr (num.GetValue));
end;

end.
