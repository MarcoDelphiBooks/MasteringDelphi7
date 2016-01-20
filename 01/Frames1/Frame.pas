unit Frame;

interface

uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TFrame1 = class(TFrame)
    EditList: TEdit;
    ListList: TListBox;
    btnAdd: TButton;
    btnDelete: TButton;
    procedure btnAddClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

procedure TFrame1.btnAddClick(Sender: TObject);
begin
  if EditList.Text <> '' then
    ListList.Items.Add (EditList.Text);
end;

procedure TFrame1.btnDeleteClick(Sender: TObject);
begin
  if ListList.ItemIndex >= 0 then
    ListList.Items.Delete (ListList.ItemIndex);
end;

end.
