unit HintForm;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls, AppEvnts;

type          
  TForm1 = class(TForm)
    Label1: TLabel;
    ApplicationEvents1: TApplicationEvents;
    ListBox1: TListBox;
    procedure Listbox1Click(Sender: TObject);
    procedure ShowHint (var HintStr: string;
      var CanShow: Boolean; var HintInfo: THintInfo);
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.ShowHint (var HintStr: string;
  var CanShow: Boolean; var HintInfo: THintInfo);
var
  nItem: Integer;
begin
  with HintInfo do
    // if the control is the label show the hint in the middle
    if HintControl = Label1 then
      HintPos := HintControl.ClientToScreen (Point (
        HintControl.Width div 2, HintControl.Height div 2))
    else if HintControl = ListBox1 then
    begin
      nItem := ListBox1.ItemAtPos(
        Point (CursorPos.x, CursorPos.Y), True);
      if nItem >= 0 then
      begin
        // set the hint string
        HintStr := ListBox1.Items[nItem];
        // determine area for hint validity
        CursorRect := ListBox1.ItemRect(nItem);
        // display over the item
        HintPos := HintControl.ClientToScreen (Point(
          0, ListBox1.ItemHeight * (nItem - ListBox1.TopIndex)));
      end
      else
        CanShow := False;
    end;
end;

procedure TForm1.Listbox1Click(Sender: TObject);
begin
  Label1.Caption := Label1.Caption +
    ' - ' + ListBox1.Items [ListBox1.ItemIndex];
end;

end.

