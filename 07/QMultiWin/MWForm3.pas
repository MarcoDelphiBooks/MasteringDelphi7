unit MWForm3;

interface

uses
  Qt, SysUtils, Classes, QGraphics, QControls, QForms, QDialogs;

type
  TForm3 = class(TForm)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

// removed for extra safety
{var
  Form3: TForm3;}

implementation

{$R *.xfm}

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
