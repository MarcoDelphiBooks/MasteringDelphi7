unit OneF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
  private
  public
    procedure WMApp (var msg: TMessage); message wm_App;
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

{ TForm1 }

procedure TForm1.WMApp(var msg: TMessage);
begin
  Application.Restore;
end;

end.
