unit SplitHF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    MemoUp: TMemo;
    Splitter1: TSplitter;
    MemoDown: TMemo;
    OpenDialog1: TOpenDialog;
    StatusBar1: TStatusBar;
    procedure Splitter1Moved(Sender: TObject);
    procedure MemoDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Splitter1Moved(Sender: TObject);
begin
  StatusBar1.Panels[0].Text := Format (
    'Upper Memo: %d - Lower Memo: %d',
    [MemoUp.Height, MemoDown.Height]); 
end;

procedure TForm1.MemoDblClick(Sender: TObject);
begin
  with Sender as TMemo, OpenDialog1 do
    if Execute then
      Lines.LoadFromFile (FileName);
end;

end.
