unit ObjsForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    btnCount: TButton;
    btnLeak: TButton;
    lblCount: TLabel;
    procedure btnCountClick(Sender: TObject);
    procedure btnLeakClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnCountClick(Sender: TObject);
begin
  lblCount.Caption := IntToStr (AllocMemCount);
end;

procedure TForm1.btnLeakClick(Sender: TObject);
begin
  TButton.Create (nil);
end;

end.
