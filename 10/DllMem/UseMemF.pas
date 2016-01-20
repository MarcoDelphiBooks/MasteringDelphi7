unit UseMemF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Spin, ComCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label1: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    Edit2: TEdit;
    Button4: TButton;
    Edit3: TEdit;
    UpDown2: TUpDown;
    Button5: TButton;
    Edit4: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

function GetData: Integer; stdcall;
  external 'dllmem.dll';
procedure SetData (I: Integer); stdcall;
  external 'dllmem.dll';
function GetShareData: Integer; stdcall;
  external 'dllmem.dll';
procedure SetShareData (I: Integer); stdcall;
  external 'dllmem.dll';

procedure TForm1.Button1Click(Sender: TObject);
begin
  SetData (UpDown1.Position);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Edit2.Text := IntToStr (GetData);
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  HDLLInst: THandle;
begin
  HDLLInst := SafeLoadLibrary ('dllmem.dll');
  Label1.Caption := Format ('Address: %p', [
    GetProcAddress (HDLLInst, 'SetData')]);
  FreeLibrary (HDLLInst);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  SetShareData (UpDown2.Position);
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  Edit4.Text := IntToStr (GetShareData);
end;

end.
