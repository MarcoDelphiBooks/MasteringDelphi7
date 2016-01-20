unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFormMain = class(TForm)
    btnLoad: TButton;
    btnSave: TButton;
    btnShow: TButton;
    procedure btnLoadClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnShowClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

uses
  FormOperations;

{$R *.DFM}

procedure TFormMain.btnLoadClick(Sender: TObject);
var
  i: Integer;
  iFormOp: IFormOperations;
begin
  for i := 0 to Screen.FormCount - 1 do
    if Supports (Screen.Forms [i], IFormOperations, iFormOp) then
      iFormOp.Load;
end;

procedure TFormMain.btnSaveClick(Sender: TObject);
var
  i: Integer;
  iFormOp: IFormOperations;
begin
  for i := 0 to Screen.FormCount - 1 do
    if Supports (Screen.Forms [i], IFormOperations, iFormOp) then
      iFormOp.Save;
end;

procedure TFormMain.btnShowClick(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to Screen.FormCount - 1 do
    Screen.Forms[i].Show;
end;

end.
