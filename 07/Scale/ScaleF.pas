unit ScaleF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Spin, Mask, ComCtrls;

type
  TForm1 = class(TForm)
    ScaleButton: TButton;
    RestoreButton: TButton;
    Label1: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    procedure ScaleButtonClick(Sender: TObject);
    procedure RestoreButtonClick(Sender: TObject);
  private
    { Private declarations }
    AmountScaled: Integer;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.ScaleButtonClick(Sender: TObject);
begin
  AmountScaled := UpDown1.Position;
  ScaleBy (AmountScaled, 100);
  UpDown1.Height := Edit1.Height;
  ScaleButton.Enabled := False;
  RestoreButton.Enabled := True;
end;

procedure TForm1.RestoreButtonClick(Sender: TObject);
begin
  ScaleBy (100, AmountScaled);
  UpDown1.Height := Edit1.Height;
  ScaleButton.Enabled := True;
  RestoreButton.Enabled := False;
end;

end.
