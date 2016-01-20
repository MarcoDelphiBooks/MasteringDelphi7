unit ScaleF;

interface

uses
  SysUtils, Qt, Classes, QGraphics, QControls,
  QForms, QDialogs, QStdCtrls, Spin, QMask, QComCtrls;

type
  TForm1 = class(TForm)
    ScaleButton: TButton;
    RestoreButton: TButton;
    Label1: TLabel;
    SpinEdit1: TSpinEdit;
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

{$R *.xfm}

procedure TForm1.ScaleButtonClick(Sender: TObject);
begin
  AmountScaled := SpinEdit1.Value;
  ScaleBy (AmountScaled, 100);
  ScaleButton.Enabled := False;
  RestoreButton.Enabled := True;
end;

procedure TForm1.RestoreButtonClick(Sender: TObject);
begin
  ScaleBy (100, AmountScaled);
  ScaleButton.Enabled := True;
  RestoreButton.Enabled := False;
end;

end.
