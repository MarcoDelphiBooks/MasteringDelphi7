unit SecondF;

interface

uses
  SysUtils, Windows, Messages, Classes,
  Graphics, Controls, Forms, Dialogs, StdCtrls;

type
  TSecondForm = class(TForm)
    CloseButton: TButton;
    procedure CloseButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SecondForm: TSecondForm;

implementation

{$R *.DFM}

uses
  ScreenF;

procedure TSecondForm.CloseButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TSecondForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  {actually delete the form}
  Action := caFree;
end;

procedure TSecondForm.FormDestroy(Sender: TObject);
begin
  {post a message to the main form, but only if it is
  not closing, to avoid a GPFault}
  if not (csDestroying in MainForm.ComponentState) then
    PostMessage (MainForm.Handle, wm_User, 0, 0);
end;

end.

