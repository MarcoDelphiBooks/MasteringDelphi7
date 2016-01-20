unit LdDemoF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, MdListDial;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    MdListDialog1: TMdListDialog;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
begin
  // select the text of the edit,
  // if corresponding to one of the strings
  MdListDialog1.Selected :=
    MdListDialog1.Lines.IndexOf (Edit1.Text);
  // run the dialog and get the result
  if MdListDialog1.Execute then
    Edit1.Text := MdListDialog1.SelItem;
end;

end.
