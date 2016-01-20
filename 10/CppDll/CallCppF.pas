unit CallCppF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Spin, ExtCtrls;

type
  TForm1 = class(TForm)
    BtnDouble: TButton;
    SpinEdit1: TSpinEdit;
    Label1: TLabel;
    BtnTriple: TButton;
    Label2: TLabel;
    SpinEdit2: TSpinEdit;
    BtnAdd: TButton;
    Label3: TLabel;
    Edit1: TEdit;
    Bevel1: TBevel;
    procedure BtnDoubleClick(Sender: TObject);
    procedure BtnTripleClick(Sender: TObject);
    procedure BtnAddClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

{definition of the functions of the DLL}
function Add (A, B: Integer): Integer;
  stdcall; external 'CPPDLL.DLL' name '@Add$qqsii';
function Double (N: Integer): Integer;
  stdcall; external 'CPPDLL.DLL' name 'Double';
function Triple (N: Integer): Integer;
  stdcall; external 'CPPDLL.DLL';

procedure TForm1.BtnDoubleClick(Sender: TObject);
begin
  SpinEdit1.Value := Double (SpinEdit1.Value);
end;

procedure TForm1.BtnTripleClick(Sender: TObject);
begin
  SpinEdit2.Value := Triple (SpinEdit2.Value);
end;

procedure TForm1.BtnAddClick(Sender: TObject);
begin
  Edit1.Text := IntToStr (Add (
    SpinEdit1.Value, SpinEdit2.Value));
end;

end.
