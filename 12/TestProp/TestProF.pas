unit TestProF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Spin, NumIntf;

// redeclare the interface
const
  Class_NumPropServer: TGUID =
    '{B165F7A1-DDF9-11D1-B9F1-004845400FAA}';

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
    Num1, Num2: INumberProp;
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
  Num1 := CreateComObject (Class_NumPropServer)
    as INumberProp;
  Num1.Value := SpinEdit1.Value;
  Label1.Caption := 'Num1: ' + IntToStr (Num1.Value);
  Button1.Enabled := True;
  Button2.Enabled := True;

  // create second object
  Num2 := CreateComObject (Class_NumPropServer)
    as INumberProp;
  Label2.Caption := 'Num2: ' + IntToStr (Num2.Value);
  Button3.Enabled := True;
  Button4.Enabled := True;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  // change
  Num1.Value := SpinEdit1.Value;
  Label1.Caption := 'Num1: ' + IntToStr (Num1.Value);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  // increase
  Num1.Increase;
  Label1.Caption := 'Num1: ' + IntToStr (Num1.Value);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Num2.Value := SpinEdit2.Value;
  Label2.Caption := 'Num2: ' + IntToStr (Num2.Value);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  Num2.Increase;
  Label2.Caption := 'Num2: ' + IntToStr (Num2.Value);
end;

procedure TForm1.Button5Click(Sender: TObject);
var
  Num3: INumberProp;
begin
  // create a new temporary COM object
  Num3 := CreateComObject (Class_NumPropServer)
    as INumberProp;
  Num3.Value := 100;
  Num3.Increase;
  ShowMessage ('Num3: ' + IntToStr (Num3.Value));
end;

end.
