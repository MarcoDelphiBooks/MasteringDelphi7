unit Main;

interface

uses Qt, Classes, QGraphics, QForms, QControls,
     StyleD, ListD, QStdCtrls, QExtCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    StyleButton: TButton;
    Bevel1: TBevel;
    procedure LabelDoubleClick(Sender: TObject);
    procedure LabelClick(Sender: TObject);
    procedure StyleButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.xfm}

procedure TForm1.LabelDoubleClick(Sender: TObject);
begin
  with ListDial.Listbox1 do
  begin
    // select current the name in the listbox
    ItemIndex := Items.IndexOf ((Sender as TLabel).Caption);
    // show the modal dialog box, checking the return value
    if (ListDial.ShowModal = mrOk) and (ItemIndex >= 0) then
      // if OK, then copy the selected item of the list to the label
      (Sender as TLabel).Caption := Items [ItemIndex];
  end;
end;

procedure TForm1.LabelClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to ComponentCount - 1 do
   if (Components[I] is TLabel) and
       (Components[I].Tag = 1) then
     TLabel (Components[I]).Font.Color := clBlack;

  // set the color of the clicked label to red
  (Sender as TLabel).Font.Color := clRed;
end;

procedure TForm1.StyleButtonClick(Sender: TObject);
begin
  // run modeless dialog
  StyleDial.Show;
end;

end.

