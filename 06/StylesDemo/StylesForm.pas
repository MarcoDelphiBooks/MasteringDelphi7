unit StylesForm;

interface

uses
  SysUtils, Types, Classes, Variants, QGraphics, QControls, QForms, QDialogs,
  QStdCtrls, QStyle, QComCtrls, QMenus, QTypes;

type
  TForm1 = class(TForm)
    Button1: TButton;
    ListBox1: TListBox;
    CheckBox1: TCheckBox;
    ComboBox1: TComboBox;
    ScrollBar1: TScrollBar;
    TrackBar1: TTrackBar;
    Edit1: TEdit;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    TreeView1: TTreeView;
    ListBox2: TListBox;
    procedure ListBox1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.xfm}

procedure TForm1.ListBox1DblClick(Sender: TObject);
begin
  Application.Style.DefaultStyle :=
    TDefaultStyle (ListBox1.ItemIndex);
end;

end.
