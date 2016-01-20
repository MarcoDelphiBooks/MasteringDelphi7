unit ChOwn1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    ButtonChange: TButton;
    ButtonList: TButton;
    ListBox1: TListBox;
    procedure ButtonChangeClick(Sender: TObject);
    procedure ButtonListClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses ChOwn2;

{$R *.DFM}

procedure ChangeOwner (Component, NewOwner: TComponent);
begin
  Component.Owner.RemoveComponent (Component);
  NewOwner.InsertComponent (Component);
end;

procedure TForm1.ButtonChangeClick(Sender: TObject);
begin
  if Assigned (Button1) then
  begin
    // change parent
    Button1.Parent := Form2;
    // change owner
    ChangeOwner (Button1, Form2);
  end;
end;

procedure TForm1.ButtonListClick(Sender: TObject);
var
 I: Integer;
begin
  ListBox1.Items.Clear;
  for I := 0 to ComponentCount - 1 do
    ListBox1.Items.Add (Components[I].Name);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  ShowMessage ('My owner is ' +
    ((Sender as TButton).Owner as TForm).Caption);
end;

end.
