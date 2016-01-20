unit ScrollF;

interface

uses
 Windows, Classes, Graphics, Forms, Controls,
 StdCtrls, SysUtils, Messages, Statusf;

type
  TForm1 = class(TForm)
    ListBox1: TListBox;
    ListBox2: TListBox;
    ListBox3: TListBox;
    ListBox4: TListBox;
    ListBox5: TListBox;
    ListBox6: TListBox;
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    procedure WMHScroll (var ScrollData: TWMScroll); message wm_HScroll;
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormResize(Sender: TObject);
begin
  Status.Label3.Caption := IntToStr(ClientWidth);
  Status.Label4.Caption := IntToStr(HorzScrollBar.Position);
end;

procedure TForm1.WMHScroll (var ScrollData: TWMScroll);
begin
  inherited;
  Status.Label3.Caption := IntToStr(ClientWidth);
  Status.Label4.Caption := IntToStr(HorzScrollBar.Position);
end;

end.
