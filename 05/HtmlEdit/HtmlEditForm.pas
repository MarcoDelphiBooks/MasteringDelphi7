unit HtmlEditForm;

interface

uses
  SysUtils, Types, Classes, Variants, QGraphics, QControls, QForms, QDialogs,
  QStdCtrls, QComCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    TextViewer1: TTextViewer;
    procedure Memo1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.xfm}

procedure TForm1.Memo1Change(Sender: TObject);
begin
  TextViewer1.Text := Memo1.Lines.Text;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  TextViewer1.Text := Memo1.Lines.Text;
end;

end.
