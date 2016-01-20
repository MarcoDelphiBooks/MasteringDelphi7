unit InftForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class (TForm)
    btnAthlete: TButton;
    btnClear: TButton;
    btnMyJumper: TButton;
    btnRunner: TButton;
    ListBox1: TListBox;
    procedure btnAthleteClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure btnMyJumperClick(Sender: TObject);
    procedure btnRunnerClick(Sender: TObject);
  public
    procedure Log(str: string);
  end;
  
var
  Form1: TForm1;

implementation

{$R *.DFM}

uses
  WalkIntf;

{
************************************ TForm1 ************************************
}
procedure TForm1.btnAthleteClick(Sender: TObject);
var
  W1: IWalker;
  J1: IJumper;
begin
  W1 := TAthlete.Create;
  Log ('TAthlete.Create');
  Log (W1.Run);
  Log (W1.Walk);
  Log (W1.Run);
  Log ((W1 as IJumper).Jump);
  
  // see Chapter 4 (System unit) for a description
  // of the Supports RTL function
  if Supports (w1, IJumper) then
  begin
    J1 := W1 as IJumper;
    Log (J1.Walk);
  end;
  Log ('');
end;

procedure TForm1.btnClearClick(Sender: TObject);
begin
  ListBox1.Clear;
end;

procedure TForm1.btnMyJumperClick(Sender: TObject);
var
  J1: IJumper;
begin
  J1 := TMyJumper.Create as IJumper;
  
  Log ('TMyJumper.Create');
  Log (J1.Walk);
  Log (J1.Jump);
  Log (J1.Walk);
  Log ('');
end;

procedure TForm1.btnRunnerClick(Sender: TObject);
var
  W1: IWalker;
begin
  W1 := TRunner.Create;
  Log ('TRunner.Create');
  Log (W1.Run);
  Log (W1.Walk);
  Log (W1.Run);
  Log ('');
end;

procedure TForm1.Log(str: string);
begin
  ListBox1.Items.Add (str);
end;

end.

