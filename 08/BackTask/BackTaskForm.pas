unit BackTaskForm;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    ProgressBar1: TProgressBar;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{function local to the unit}
function IsPrime (N: Integer): Boolean;
var
  Test: Integer;
begin
  IsPrime := True;
  for Test := 2 to N - 1 do
    if (N mod Test) = 0 then
    begin
      IsPrime := False;
      break; {jump out of the for loop}
    end;
end;

const
  Max = 100000;

procedure TForm1.Button1Click(Sender: TObject);
var
  I, Tot: Integer;
begin
  Tot := 0;
  for I := 1 to Max do
  begin
    if IsPrime (I) then
      Tot := Tot + I;
    ProgressBar1.Position := I * 100 div Max;
  end;
  ShowMessage (IntToStr (Tot));
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  I, Tot: Integer;
begin
  Tot := 0;
  for I := 1 to Max do
  begin
    if IsPrime (I) then
      Tot := Tot + I;
    ProgressBar1.Position := I * 100 div Max;
    Application.ProcessMessages;
  end;
  ShowMessage (IntToStr (Tot));
end;

// custom thread class

type
  TPrimeAdder = class(TThread)
  private
    FMax, FTotal, FPosition: Integer;
  protected
    procedure Execute; override;
    procedure ShowTotal;
    procedure UpdateProgress;
  public
    property Max: Integer read FMax write FMax;
  end;

procedure TPrimeAdder.Execute;
var
  I, Tot: Integer;
begin
  Tot := 0;
  for I := 1 to FMax do
  begin
    if IsPrime (I) then
      Tot := Tot + I;
    if I mod (fMax div 100) = 0 then
    begin
      FPosition := I * 100 div fMax;
      Synchronize(UpdateProgress);
    end;
  end;
  FTotal := Tot;
  Synchronize(ShowTotal);
end;

procedure TPrimeAdder.ShowTotal;
begin
  ShowMessage ('Thread: ' + IntToStr (FTotal));
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  AdderThread: TPrimeAdder;
begin
  AdderThread := TPrimeAdder.Create (True);
  AdderThread.Max := Max;
  AdderThread.FreeOnTerminate := True;
  AdderThread.Resume;
end;

procedure TPrimeAdder.UpdateProgress;
begin
  Form1.ProgressBar1.Position := fPosition;
end;

end.
