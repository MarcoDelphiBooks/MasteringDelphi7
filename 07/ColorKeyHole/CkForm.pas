unit CkForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    Shape1: TShape;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

uses
  AlphaForm, PlainForm;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Form2.Show;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  i: integer;
begin
  Form2.AlphaBlendValue := 100;
  Form2.Show;
  for i := 100 to 255 do
  begin
    Form2.AlphaBlendValue := i;
    Application.ProcessMessages;
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Form3.Hide;
  AnimateWindow (Form3.Handle, 2000, AW_BLEND);
  Form3.Show;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  Form3.Hide;
  AnimateWindow (Form3.Handle, 3000, AW_CENTER);
  // you can also use AW_HOR_POSITIVE, AW_HOR_NEGATIVE,
  // AW_VER_POSITIVE, or AW_VER_NEGATIVE
  Form3.Show;
end;

end.
