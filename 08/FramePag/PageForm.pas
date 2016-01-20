unit PageForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Frame2u, Frame3u, StdCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Button1: TButton;
    Button2: TButton;
    Frame21: TFrame2;
    Frame31: TFrame3;
    TabSheet3: TTabSheet;
    Frame32: TFrame3;
    procedure PageControl1Change(Sender: TObject);
    procedure Frame31btnAddClick(Sender: TObject);
    procedure Form1Close(Sender: TObject; var Action: TCloseAction);
    procedure Form1Destroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.PageControl1Change(Sender: TObject);
begin
  (PageControl1.ActivePage.Controls[0]
    as TWinControl).SetFocus;
end;

procedure TForm1.Frame31btnAddClick(Sender: TObject);
begin
  Frame31.btnAddClick(Sender);

end;

procedure TForm1.Form1Close(Sender: TObject; var Action: TCloseAction);
begin
  Beep;
end;

procedure TForm1.Form1Destroy(Sender: TObject);
begin
  Beep;
end;

end.
