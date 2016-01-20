unit ReintrF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TMyClass = class
    procedure One; overload; virtual;
    procedure One (I: Integer); overload;
  end;

  TMySubClass = class (TMyClass)
    procedure One; overload; override;
    procedure One (S: string); reintroduce; overload;
  end;

  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

{ MyClass }

procedure TMyClass.One;
begin
  ShowMessage ('MyClass.One');
end;

procedure TMyClass.One(I: Integer);
begin
  ShowMessage ('Integer: ' + IntToStr (I));
end;

{ MySubClass }

procedure TMySubClass.One;
begin
  ShowMessage ('MySubClass.One');
end;

procedure TMySubClass.One(S: string);
begin
  ShowMessage ('String: ' + S);
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  Obj: TMySubClass;
begin
  Obj := TMySubClass.Create;
  Obj.One;
  Obj.One (10);
  Obj.One ('Hello');
  Obj.Free;
end;

end.
