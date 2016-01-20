{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
{$WARN UNSAFE_CAST OFF}

unit ListForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    ButtonAdd: TButton;
    ButtonList: TButton;
    ListBox1: TListBox;
    ButtonWrong: TButton;
    procedure ButtonAddClick(Sender: TObject);
    procedure ButtonListClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonWrongClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    ListDate: TList;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

uses
  Dates;

procedure TForm1.ButtonAddClick(Sender: TObject);
begin
  ListDate.Add (TDate.Create (
    1900 + Random (200), 1 + Random (12), 1 + Random (30)));
end;

procedure TForm1.ButtonListClick(Sender: TObject);
var
  I: Integer;
begin
  ListBox1.Clear;
  for I := 0 to ListDate.Count - 1 do
    Listbox1.Items.Add ((TObject(ListDate [I]) as TDate).Text);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Randomize;
  ListDate := TList.Create;
end;

procedure TForm1.ButtonWrongClick(Sender: TObject);
begin
  // add a button to the list
  ListDate.Add (Sender);
end;

procedure TForm1.FormDestroy(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to ListDate.Count - 1 do
    TObject(ListDate [I]).Free;
  ListDate.Free;  
end;

end.
