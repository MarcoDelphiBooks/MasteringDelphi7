unit NameValForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ValEdit;

type
  TForm1 = class(TForm)
    ValueListEditor1: TValueListEditor;
    Memo1: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    btnUp: TButton;
    btnDown: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnUpClick(Sender: TObject);
    procedure btnDownClick(Sender: TObject);
    procedure ValueListEditor1StringsChange(Sender: TObject);
    procedure ValueListEditor1EditButtonClick(Sender: TObject);
  private
    FirstItemProp, SharedItemProp: TItemProp;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  SharedItemProp := TItemProp.Create (ValueListEditor1);
  SharedItemProp.EditMask := '999;0; ';
  SharedItemProp.EditStyle := esEllipsis;

  FirstItemProp := TItemProp.Create (ValueListEditor1);
  for I := 1 to 10 do
    FirstItemProp.PickList.Add(IntToStr (I));

  Memo1.Lines := ValueListEditor1.Strings;
  ValueListEditor1.ItemProps [0] := FirstItemProp;
  for I := 1 to ValueListEditor1.Strings.Count - 1 do
    ValueListEditor1.ItemProps [I] := SharedItemProp;
end;

procedure TForm1.btnUpClick(Sender: TObject);
begin
  ValueListEditor1.Strings := Memo1.Lines;
end;

procedure TForm1.btnDownClick(Sender: TObject);
begin
  Memo1.Lines := ValueListEditor1.Strings;
end;

procedure TForm1.ValueListEditor1StringsChange(Sender: TObject);
var
  I: Integer;
begin
  ValueListEditor1.ItemProps [0] := FirstItemProp;
  for I := 1 to ValueListEditor1.Strings.Count - 1 do
    if not Assigned (ValueListEditor1.ItemProps [I]) then
      ValueListEditor1.ItemProps [I] := SharedItemProp;
end;

procedure TForm1.ValueListEditor1EditButtonClick(Sender: TObject);
begin
  ShowMessage ('Sorry, no help provided');
end;

end.
