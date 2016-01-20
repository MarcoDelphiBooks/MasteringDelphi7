unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Viewer;

type
  TMainForm = class(TForm)
    ReloadButton1: TButton;
    ReloadButton2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure ReloadButton1Click(Sender: TObject);
    procedure ReloadButton2Click(Sender: TObject);
  private
    FormList: array [1..2] of TViewerForm;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses BmpView, TextView;

{$R *.DFM}

procedure TMainForm.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  FormList [1] :=
    TTextViewerForm.Create (Application);
  FormList [2] :=
    TImageViewerForm.Create (Application);
  for I := 1 to 2 do
    FormList[I].Show;
end;

procedure TMainForm.ReloadButton1Click(Sender: TObject);
var
  I: Integer;
begin
  for I := 1 to 2 do
    FormList[I].ButtonLoadClick (Self);
end;

procedure TMainForm.ReloadButton2Click(Sender: TObject);
var
  I: Integer;
begin
  for I := 1 to 2 do
    FormList[I].LoadFile;
end;

end.
