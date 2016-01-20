unit NoTitleF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure CreateParams (var Params: TCreateParams); override;
    procedure WMNCHitTest (var Msg: TWMNCHitTest);
      message wm_NcHitTest;
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.CreateParams (var Params: TCreateParams);
begin
  inherited CreateParams (Params);
  Params.Style := (Params.Style or ws_Popup) and
    not ws_Caption;
end;

procedure TForm1.WMNCHitTest(var Msg: TWMNCHitTest);
begin
  inherited;
  if (Msg.Result = htClient) and (Msg.YPos <
      Label1.Height + Top + GetSystemMetrics (sm_cyFrame)) then
    Msg.Result := htCaption;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Close;
end;

end.
