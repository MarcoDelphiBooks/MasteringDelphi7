unit Child2;

interface

uses
  Windows, Classes, Graphics, Forms,
  Controls, Menus, Dialogs, StdCtrls, ExtCtrls,
  SysUtils;

type
  Directions = (up_right, down_right, down_left, up_left);

  TBounceChildForm = class(TForm)
    Timer1: TTimer;
    Shape1: TShape;
    MainMenu1: TMainMenu;
    Square1: TMenuItem;
    FillColor1: TMenuItem;
    N1: TMenuItem;
    GetPosition1: TMenuItem;
    Movement1: TMenuItem;
    Start1: TMenuItem;
    Stop1: TMenuItem;
    ColorDialog1: TColorDialog;
    procedure Timer1Timer(Sender: TObject);
    procedure FillColor1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GetPosition1Click(Sender: TObject);
    procedure Start1Click(Sender: TObject);
    procedure Stop1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Dir : Directions;
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

procedure TBounceChildForm.Timer1Timer(Sender: TObject);
begin
  case Dir of
    up_right:
    begin
      Shape1.Left := Shape1.Left + 3;
      Shape1.Top := Shape1.Top - 3;
      if Shape1.Top <= 0 then
        Dir := down_right;
      if Shape1.Left + Shape1.Width >= ClientWidth then
        Dir := up_left;
    end;
    down_right:
    begin
      Shape1.Left := Shape1.Left + 3;
      Shape1.Top := Shape1.Top + 3;
      if Shape1.Top + Shape1.Height >= ClientHeight then
        Dir := up_right;
      if Shape1.Left + Shape1.Width >= ClientWidth then
        Dir := down_left;
    end;
    down_left:
    begin
      Shape1.Left := Shape1.Left - 3;
      Shape1.Top := Shape1.Top + 3;
      if Shape1.Top + Shape1.Height >= ClientHeight then
        Dir := up_left;
      if Shape1.Left <= 0 then
        Dir := down_right;
    end;
    up_left:
    begin
      Shape1.Left := Shape1.Left - 3;
      Shape1.Top := Shape1.Top - 3;
      if Shape1.Top <= 0 then
        Dir := down_left;
      if Shape1.Left <= 0 then
        Dir := up_right;
    end;
  end;
end;

procedure TBounceChildForm.FillColor1Click(Sender: TObject);
begin
  if ColorDialog1.Execute then
    Shape1.Brush.Color := ColorDialog1.Color;
end;

procedure TBounceChildForm.FormCreate(Sender: TObject);
begin
  ColorDialog1.Color := Shape1.Brush.Color;
  Dir := down_left;
end;

procedure TBounceChildForm.GetPosition1Click(Sender: TObject);
begin
  MessageDlg ('The top-left corner of the square was in the position (' +
    IntToStr (Shape1.Left) + ', ' + IntToStr (Shape1.Top) + ').',
    mtInformation, [mbOk], 0);
end;

procedure TBounceChildForm.Start1Click(Sender: TObject);
begin
  Timer1.Enabled := True;
  Start1.Enabled := False;
  Stop1.Enabled := True;
end;

procedure TBounceChildForm.Stop1Click(Sender: TObject);
begin
  Timer1.Enabled := False;
  Start1.Enabled := True;
  Stop1.Enabled := False;
end;

procedure TBounceChildForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.

