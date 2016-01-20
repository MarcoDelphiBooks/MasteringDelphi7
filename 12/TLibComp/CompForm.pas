unit CompForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OleServer, StdCtrls, Tlibdemo_TLB;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    FirstServer1: TFirstServer;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
begin
  FirstServer1.ChangeColor;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  FirstServer1.Value := FirstServer1.Value + 1;
end;

end.
