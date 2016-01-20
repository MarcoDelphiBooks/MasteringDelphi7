unit ListFrame;

interface

uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ToolWin, ComCtrls, StdCtrls, ExtCtrls;

type
  TFrameList = class(TFrame)
    ListBox: TListBox;
    Edit: TEdit;
    btnAdd: TButton;
    btnRemove: TButton;
    btnClear: TButton;
    Bevel: TBevel;
    procedure btnAddClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

procedure TFrameList.btnAddClick(Sender: TObject);
begin
  ListBox.Items.Add (Edit.Text);
end;

procedure TFrameList.btnRemoveClick(Sender: TObject);
begin
  if ListBox.ItemIndex >= 0 then
    ListBox.Items.Delete (ListBox.ItemIndex);
end;

procedure TFrameList.btnClearClick(Sender: TObject);
begin
  ListBox.Clear;
end;

end.
 