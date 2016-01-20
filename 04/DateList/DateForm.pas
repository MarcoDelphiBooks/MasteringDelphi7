unit DateForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DateL;

type
  TForm1 = class(TForm)
    ButtonAddDates: TButton;
    ButtonAddButton: TButton;
    ListBox1: TListBox;
    ComboBox1: TComboBox;
    procedure ButtonAddDatesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonAddButtonClick(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    ListI: TDateListI;
    ListW: TDateListW;
  public
    procedure UpdateList;
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

uses
  Dates;

procedure TForm1.ButtonAddDatesClick(Sender: TObject);
var
  I: Integer;
  Date: TDate;
begin
  Randomize;
  for I := 1 to 10 do
  begin
    Date := TDate.Create (1900 + Random (200),
      1 + Random (12), 1 + Random (28));
    ListI.Add (Date);
  end;
  for I := 1 to 10 do
  begin
    Date := TDate.Create (1900 + Random (200),
      1 + Random (12), 1 + Random (28));
    ListW.Add (Date);
  end;
  UpdateList;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ListI := TDateListI.Create;
  ListW := TDateListW.Create;
  ComboBox1.ItemIndex := 0;
end;

procedure TForm1.ButtonAddButtonClick(Sender: TObject);
begin
  ListW.Add (TDate(TButton.Create (nil)));
  TList(ListI).Add (TButton.Create (nil));
  UpdateList;
end;

procedure TForm1.UpdateList;
var
  I: Integer;
begin
  ListBox1.Clear;
  try
    if ComboBox1.ItemIndex = 0 then
      for I := 0 to ListI.Count - 1 do
        Listbox1.Items.Add (
          ListI [I].GetText)
    else
      for I := 0 to ListW.Count - 1 do
        Listbox1.Items.Add (
          ListW [I].GetText);
  except
    on E: Exception do
      Listbox1.Items.Add ('Error: ' +
        E.Message);
  end;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  UpdateList;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  // delete lists
  ListW.Free;
  ListI.Free;
end;

end.
