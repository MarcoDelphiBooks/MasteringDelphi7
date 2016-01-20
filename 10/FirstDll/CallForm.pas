unit CallForm;

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
    BtnDoubleString: TButton;
    BtnDoublePChar: TButton;
    EditSource: TEdit;
    EditDouble: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    procedure BtnDoubleClick(Sender: TObject);
    procedure BtnTripleClick(Sender: TObject);
    procedure BtnDoubleStringClick(Sender: TObject);
    procedure BtnDoublePCharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

{functions of the Delphi DLL}
function Double (N: Integer): Integer;
  stdcall; external 'FIRSTDLL.DLL';
function Triple (N: Integer): Integer;
  stdcall; external 'FIRSTDLL.DLL';
function DoubleString (S: string; Separator: Char): string;
  stdcall; external 'FIRSTDLL.DLL';
function DoublePChar (BufferIn, BufferOut: PChar;
  BufferOutLen: Cardinal; Separator: Char): LongBool;
  stdcall; external 'FIRSTDLL.DLL';

procedure TForm1.BtnDoubleClick(Sender: TObject);
begin
  SpinEdit1.Value := Double (SpinEdit1.Value);
end;

procedure TForm1.BtnTripleClick(Sender: TObject);
begin
  SpinEdit2.Value:= Triple (SpinEdit2.Value);
end;

procedure TForm1.BtnDoubleStringClick(Sender: TObject);
begin
  // call the DLL function directly
  EditDouble.Text :=
    DoubleString (EditSource.Text, ';');
end;

procedure TForm1.BtnDoublePCharClick(Sender: TObject);
var
  Buffer: string;
begin
  // make the buffer large enough
  SetLength (Buffer, 1000);
  // call the DLL function
  if DoublePChar (PChar (EditSource.Text), PChar (Buffer), 1000, '/') then
    EditDouble.Text := Buffer;
end;

end.
