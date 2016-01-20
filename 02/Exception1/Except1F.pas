unit Except1F;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls;
type
  TForm1 = class(TForm)
    ButtonDivide1: TButton;
    ButtonDivide2: TButton;
    ButtonRaise1: TButton;
    ButtonRaise2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure ButtonDivide1Click(Sender: TObject);
    procedure ButtonDivide2Click(Sender: TObject);
    procedure ButtonRaise1Click(Sender: TObject);
    procedure ButtonRaise2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

{new type of exception}
type
  EArrayFull = class (Exception);

function DivideTwicePlusOne (A, B: Integer): Integer;
begin
  try
    // error if B equals 0
    Result := A div B;
    // do something else... skip if exception is raised
    Result := Result div B;
    Result := Result + 1;
  except
    on EDivByZero do
    begin
      Result := 0;
      MessageDlg ('Divide by zero corrected',
        mtError, [mbOK], 0);
    end;
    on E: Exception do
    begin
      Result := 0;
      MessageDlg (E.Message,
        mtError, [mbOK], 0);
    end;
  end; // end except
end;

{fake procedure: the array is always full}
procedure AddToArray (N: Integer);
begin
  raise EArrayFull.Create ('Array full');
end;

procedure TForm1.ButtonDivide1Click(Sender: TObject);
begin
  DivideTwicePlusOne (10, 0);
end;

procedure TForm1.ButtonDivide2Click(Sender: TObject);
var
  A, B, C: Integer;
begin
  A := 10;
  B := 0;
  {generates an exception, which is not handled by us}
  C := A div B;
  {we have to use the result, or the optimizer will
  remove the code and the error, too}
  Caption := IntToStr (C);
end;

procedure TForm1.ButtonRaise1Click(Sender: TObject);
begin
  try
    {this procedure raises an exception}
    AddToArray (24);
  except
    {simply ignores the exception}
    on EArrayFull do; {do nothing}
  end;
end;

procedure TForm1.ButtonRaise2Click(Sender: TObject);
begin
  {unguarded call}
  AddToArray (24);
end;

end.

