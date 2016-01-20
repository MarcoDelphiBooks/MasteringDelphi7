unit IWMainForm;
{PUBDIST}

interface

uses
  IWAppForm, IWApplication, IWTypes, IWCompListbox, IWCompEdit, Classes,
  Controls, IWControl, IWCompButton, Menus, IWCompMenu, IWGrids,
  IWAnotherForm;

type
  TformMain = class(TIWAppForm)
    IWGrid1: TIWGrid;
    btnShowGraphic: TIWButton;
    btnCloseMain: TIWButton;
    procedure btnShowGraphicClick(Sender: TObject);
    procedure btnCloseMainClick(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
  public
    // per session data: even better save it in TUserSession
    anotherform: TAnotherForm;
  end;

implementation

{$R *.dfm}

uses
  ServerController, IWHTMLControls, SysUtils;

procedure TformMain.btnShowGraphicClick(Sender: TObject);
begin
  anotherform := TAnotherForm.Create(WebApplication);
  anotherform.Show;
end;

procedure TformMain.btnCloseMainClick(Sender: TObject);
begin
  // show a message
  // WebApplication.Terminate('Hello');
  // redirect user to another page/site
  WebApplication.TerminateAndRedirect('http://www.marcocantu.com');
end;

procedure TformMain.IWAppFormCreate(Sender: TObject);
var
  i: Integer;
  link: TIWURL;
begin
  // set grid titles
  IWGrid1.Cell[0, 0].Text := 'Row';
  IWGrid1.Cell[0, 1].Text := 'Owner';
  IWGrid1.Cell[0, 2].Text := 'Web Site';
  // set grid contents
  for i := 1 to IWGrid1.RowCount - 1 do
  begin
    IWGrid1.Cell [i,0].Text := 'Row ' + IntToStr (i+1);
    IWGrid1.Cell [i,1].Text := 'IWTwoForms by Marco Cantù';
    link := TIWURL.Create(self);
    link.Text := 'Click here';
    link.URL := 'http://www.marcocantu.com';
    // link.FriendlyName := '/link';
    IWGrid1.Cell [i,2].Control := link;
  end;
end;

end.