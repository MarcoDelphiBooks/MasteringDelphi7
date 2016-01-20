unit FramesForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ListFrame, StdCtrls;

type
  TFormFrames = class(TForm)
    FrameList1: TFrameList;
    FrameList2: TFrameList;
    btnLeft: TButton;
    btnRight: TButton;
    procedure FrameList2btnClearClick(Sender: TObject);
    procedure btnLeftClick(Sender: TObject);
    procedure btnRightClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormFrames: TFormFrames;

implementation

{$R *.DFM}

procedure TFormFrames.FrameList2btnClearClick(Sender: TObject);
begin
  if MessageDlg ('OK to empty the list box?',
      mtConfirmation, [mbYes, mbNo], 0) = idYes then
    // execute standard frame code
    FrameList2.btnClearClick(Sender);
end;

procedure TFormFrames.btnLeftClick(Sender: TObject);
begin
  FrameList1.ListBox.Items.AddStrings (
    FrameList2.ListBox.Items);
end;

procedure TFormFrames.btnRightClick(Sender: TObject);
begin
  FrameList2.ListBox.Items.AddStrings (
    FrameList1.ListBox.Items);
end;

end.
