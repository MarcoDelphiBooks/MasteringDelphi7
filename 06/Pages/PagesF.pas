unit PagesF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, ImgList;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    ListBox1: TListBox;
    BitBtnPrevious: TBitBtn;
    BitBtnNext: TBitBtn;
    EditWidth: TEdit;
    UpDown1: TUpDown;
    Label1: TLabel;
    CheckBoxMultiLine: TCheckBox;
    CheckBoxVisible: TCheckBox;
    BitBtnApply: TBitBtn;
    Memo1: TMemo;
    Label2: TLabel;
    EditHeight: TEdit;
    UpDown2: TUpDown;
    Label3: TLabel;
    BitBtnChange: TBitBtn;
    ImageList1: TImageList;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    BitBtnAdd: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure BitBtnApplyClick(Sender: TObject);
    procedure BitBtnChangeClick(Sender: TObject);
    procedure BitBtnNextClick(Sender: TObject);
    procedure BitBtnPreviousClick(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure BitBtnAddClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  {fill the listbox and the memo
  with the names of the pages}
  for I := 0 to PageControl1.PageCount -1 do
  begin
    ListBox1.Items.Add (
      PageControl1.Pages [I].Caption);
    Memo1.Lines.Add (
      PageControl1.Pages [I].Caption);
  end;
  {set the initial width and height of tabs}
  EditWidth.Text := IntToStr (PageControl1.TabWidth);
  EditHeight.Text := IntToStr (PageControl1.TabHeight);
  {set the initial width and height of tabs}
  PageControl1.ActivePage := TabSheet1;
end;

procedure TForm1.ListBox1Click(Sender: TObject);
begin
  PageControl1.ActivePage :=
    PageControl1.Pages [ListBox1.ItemIndex];
end;

procedure TForm1.BitBtnApplyClick(Sender: TObject);
begin
  // set tab width, height, and lines
  PageControl1.TabWidth := StrToInt (EditWidth.Text);
  PageControl1.TabHeight := StrToInt (EditHeight.Text);
  PageControl1.MultiLine := CheckBoxMultiLine.Checked;
  // show or hide the last tab
  TabSheet3.TabVisible := CheckBoxVisible.Checked;
  // set the tab position
  if RadioButton1.Checked then
    PageControl1.TabPosition := tpTop
  else
    PageControl1.TabPosition := tpLeft;
end;

procedure TForm1.BitBtnChangeClick(Sender: TObject);
var
  I: Integer;
begin
  if Memo1.Lines.Count = PageControl1.PageCount then
    for I := 0 to PageControl1.PageCount -1 do
      PageControl1.Pages [I].Caption := Memo1.Lines [I];
  BitBtnChange.Enabled := False;
end;

procedure TForm1.BitBtnNextClick(Sender: TObject);
begin
  // basic version:
  {PageControl1.SelectNextPage (True);}

  // special lookup version:
  PageControl1.ActivePage :=
    PageControl1.FindNextPage (
      PageControl1.ActivePage, True, False);
end;

procedure TForm1.BitBtnPreviousClick(Sender: TObject);
begin
  {select previous page}
  PageControl1.SelectNextPage (False);
end;

procedure TForm1.Memo1Change(Sender: TObject);
begin
  BitBtnChange.Enabled := True;
end;

procedure TForm1.BitBtnAddClick(Sender: TObject);
var
  strCaption: string;
  NewTabSheet: TTabSheet;
begin
  strCaption := 'New Tab';
  if InputQuery ('New Tab', 'Tab Caption', strCaption) then
  begin
    // add a new empty page to the control
    NewTabSheet := TTabSheet.Create (PageControl1);
    NewTabSheet.Visible := True;
    NewTabSheet.Caption := strCaption;
    NewTabSheet.PageControl := PageControl1;
    PageControl1.ActivePage := NewTabSheet;
    // add it to both lists
    Memo1.Lines.Add (strCaption);
    ListBox1.Items.Add (strCaption);
  end;
end;

end.
