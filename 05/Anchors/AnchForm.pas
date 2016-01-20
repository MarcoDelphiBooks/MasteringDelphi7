unit AnchForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    BtnClose: TButton;
    BtnShow: TButton;
    ListBox1: TListBox;
    procedure BtnShowClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.BtnShowClick(Sender: TObject);
begin
  ShowMessage (ListBox1.Items [ListBox1.ItemIndex]);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  // select the first item
  ListBox1.ItemIndex := 0;
end;

procedure TForm1.BtnCloseClick(Sender: TObject);
begin
  Close;
end;

end.
