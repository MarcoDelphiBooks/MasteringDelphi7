unit ListForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Contnrs;

type
  TForm1 = class(TForm)
    ButtonAdd: TButton;
    ButtonList: TButton;
    ListBox1: TListBox;
    ButtonWrong: TButton;
    btnListStack: TButton;
    btnQueue: TButton;
    procedure ButtonAddClick(Sender: TObject);
    procedure ButtonListClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonWrongClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnListStackClick(Sender: TObject);
    procedure btnQueueClick(Sender: TObject);
  private
    ListDate: TObjectList;
    Stack: TStack;
    Queue: TQueue;
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
var
  I: Integer;
begin
  Randomize;
  ListDate := TObjectList.Create (True);
  Stack := TStack.Create;
  Queue := TQueue.Create;

  for I := 1 to 10 do
  begin
    Stack.Push (Pointer (I));
    Queue.Push (Pointer (I));
  end;
end;

procedure TForm1.ButtonWrongClick(Sender: TObject);
begin
  // add a button to the list
  ListDate.Add (Sender);
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  ListDate.Free;
  Stack.Free;
  Queue.Free;
end;

procedure TForm1.btnListStackClick(Sender: TObject);
var
  Stack2: TStack;
begin
  Stack2 := TStack.Create;
  ListBox1.Clear;
  // lists removing
  while Stack.Count > 0 do
  begin
    ListBox1.Items.Add (IntToStr (Integer (Stack.Peek)));
    Stack2.Push (Stack.Pop);
  end;
  // restores
  while Stack2.Count > 0 do
    Stack.Push (Stack2.Pop);

  ShowMessage ('Removed: ' + IntToStr (Integer (Stack.Pop)));
end;

procedure TForm1.btnQueueClick(Sender: TObject);
var
  I: Integer;
begin
  ListBox1.Clear;
  for I := 0 to Queue.Count - 1 do
  begin
    ListBox1.Items.Add (IntToStr (Integer (Queue.Peek)));
    Queue.Push (Queue.Pop);
  end;
  ShowMessage ('Removed: ' + IntToStr (Integer (Queue.Pop)));
end;

end.
