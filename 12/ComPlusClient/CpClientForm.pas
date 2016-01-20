unit CpClientForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComPlus1_TLB;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    CP1: IComPlus1Object;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  CP1.Value := 10;
  CP1.Increase(5);
  Edit1.Text := CP1.AsString;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  CP1 := CoComPlus1Object.Create;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  I: Integer;
begin
  for i := 0 to 10000 do
    Cp1.Increase (20);
  Edit1.Text := cp1.AsString;
end;

end.
