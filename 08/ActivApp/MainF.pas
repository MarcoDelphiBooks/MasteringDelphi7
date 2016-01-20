unit MainF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, AppEvnts;

type
  TForm1 = class(TForm)
    LabelApp: TLabel;
    LabelForm: TLabel;
    ApplicationEvents1: TApplicationEvents;
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure AppActivate(Sender: TObject);
    procedure AppDeactivate(Sender: TObject);
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormActivate(Sender: TObject);
begin
  LabelForm.Caption := 'Form1 Active';
  LabelForm.Color := clRed;
end;

procedure TForm1.FormDeactivate(Sender: TObject);
begin
  LabelForm.Caption := 'Form1 Not Active';
  LabelForm.Color := clBtnFace;
end;

procedure TForm1.AppActivate(Sender: TObject);
begin
  LabelApp.Caption := 'Application Active';
  LabelApp.Color := clRed;
  Beep;
end;

procedure TForm1.AppDeactivate(Sender: TObject);
begin
  LabelApp.Caption := 'Application Not Active';
  LabelApp.Color := clBtnFace;
end;

end.
