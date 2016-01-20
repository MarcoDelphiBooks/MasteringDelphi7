unit Frame3u;

interface

uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TFrame3 = class(TFrame)
    ListBox1: TListBox;
    btnAdd: TButton;
    btnDelete: TButton;
    LabelFile: TLabel;
    Label1: TLabel;
    btnSave: TButton;
    procedure btnAddClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure CreateWnd; override;
  end;

implementation

{$R *.DFM}

procedure TFrame3.btnAddClick(Sender: TObject);
var
  strNew: string;
begin
  if InputQuery ('Enter new item', 'Text', strNew) then
    ListBox1.Items.Add (strNew);
end;

procedure TFrame3.btnDeleteClick(Sender: TObject);
begin
  if ListBox1.ItemIndex >= 0 then
    ListBox1.Items.Delete (ListBox1.ItemIndex);
end;

procedure TFrame3.CreateWnd;
begin
  inherited;
  // load data
  ListBox1.Items.LoadFromFile (LabelFile.Caption);
end;

procedure TFrame3.btnSaveClick(Sender: TObject);
begin
  ListBox1.Items.SaveToFile (LabelFile.Caption);
end;

initialization
  RegisterClass (TFrame3);

end.
