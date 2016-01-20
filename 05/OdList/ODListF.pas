unit ODListF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TODListForm = class(TForm)
    ListBox1: TListBox;
    ColorDialog1: TColorDialog;
    procedure ListBox1DrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure FormCreate(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure AddColors (Colors: array of TColor);
  end;

var
  ODListForm: TODListForm;

implementation

{$R *.DFM}

procedure TODListForm.ListBox1DrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
begin
  with Control as TListbox do
  begin
    // erase
    Canvas.FillRect (Rect);
    // draw item
    Canvas.Font.Color := TColor (
      Items.Objects [Index]);
    Canvas.TextOut(Rect.Left, Rect.Top,
      Listbox1.Items[Index]);

//    InflateRect (Rect, -1, -1);
    if (odFocused in State) and (odSelected in State) then
      Canvas.DrawFocusRect (Rect);
   end;
end;

procedure TODListForm.AddColors (Colors: array of TColor);
var
  I: Integer;
begin
  for I := Low (Colors) to High (Colors) do
    ListBox1.Items.AddObject (
      ColorToString (Colors[I]),
      TObject(Colors[I]));
end;

procedure TODListForm.FormCreate(Sender: TObject);
begin
  Canvas.Font := ListBox1.Font;
  ListBox1.ItemHeight := Canvas.TextHeight('0');
  AddColors ([clRed, clBlue, clYellow, clGreen, clFuchsia, clLime, clPurple,
    clGray, RGB (213, 23, 123), RGB (0, 0, 0), clAqua, clNavy, clOlive, clTeal]);
end;

procedure TODListForm.ListBox1DblClick(Sender: TObject);
begin
  if ColorDialog1.Execute then
    AddColors ([ColorDialog1.Color]);
end;

end.
  