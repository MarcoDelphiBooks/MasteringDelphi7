unit FormPageForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin;

type
  TForm1 = class(TForm)
    ToolBar1: TToolBar;
    btnPage: TToolButton;
    PageControl1: TPageControl;
    procedure btnPageClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  FormInPage;

procedure TForm1.btnPageClick(Sender: TObject);
var
  Form: TForm;
  Sheet: TTabSheet;
begin
  // create a tabsheet within the page control
  Sheet := TTabSheet.Create(PageControl1);
  Sheet.PageControl := PageControl1;
  // create the form and place it in the tabsheet
  Form := TForm2.Create (Application);
  Form.BorderStyle := bsNone;
  Form.Align := alClient;
  Form.Parent := Sheet;
  Form. Visible := True;
  // activate and set title
  PageControl1.ActivePage := Sheet;
  Sheet.Caption := Form.Caption;
end;

end.
