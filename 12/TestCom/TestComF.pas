unit TestComF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Spin, NumIntf;

// redeclare the server GUID
const
  Class_Number: TGUID =
  '{5B2EF181-3AAE-11D3-B9F1-00000100A27B}';

type
  TForm1 = class(TForm)
    SpinEdit1: TSpinEdit;
    Button1: TButton;
    Button2: TButton;
    SpinEdit2: TSpinEdit;
    Button3: TButton;
    Button4: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Button5: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    Num1, Num2 : INumber;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

uses
  ComObj;

procedure TForm1.FormCreate(Sender: TObject);
begin
  // create first object
  Num1 := CreateComObject (Class_Number) as INumber;
  Num1.SetValue (SpinEdit1.Value);
  Label1.Caption := 'Num1: ' + IntToStr (Num1.GetValue);
  Button1.Enabled := True;
  Button2.Enabled := True;

  // create second object
  Num2 := CreateComObject (Class_Number) as INumber;
  Label2.Caption := 'Num2: ' + IntToStr (Num2.GetValue);
  Button3.Enabled := True;
  Button4.Enabled := True;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  // change
  Num1.SetValue (SpinEdit1.Value);
  Label1.Caption := 'Num1: ' + IntToStr (Num1.GetValue);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  // increase
  Num1.Increase;
  Label1.Caption := 'Num1: ' + IntToStr (Num1.GetValue);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Num2.SetValue (SpinEdit2.Value);
  Label2.Caption := 'Num2: ' + IntToStr (Num2.GetValue);
end;


procedure TForm1.Button4Click(Sender: TObject);
begin
  Num2.Increase;
  Label2.Caption := 'Num2: ' + IntToStr (Num2.GetValue);
end;

procedure TForm1.Button5Click(Sender: TObject);
var
  Num3: INumber;
begin
  // create a new temporary COM object
  Num3 := CreateComObject (Class_Number) as INumber;
  Num3.SetValue (100);
  Num3.Increase;
  ShowMessage ('Num3: ' + IntToStr (Num3.GetValue));
end;

end.
