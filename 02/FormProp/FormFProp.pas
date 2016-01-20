unit FormFProp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    btnCreateForm: TButton;
    procedure FormClick(Sender: TObject);
    procedure btnCreateFormClick(Sender: TObject);
  private
    FClicks: Integer;
    procedure SetClicks(const Value: Integer);
    { Private declarations }
  public
    property Clicks: Integer read FClicks write SetClicks;
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

{ TForm1 }

procedure TForm1.SetClicks(const Value: Integer);
begin
  FClicks := Value;
end;

procedure TForm1.FormClick(Sender: TObject);
begin
  Inc (FClicks);
  Caption := 'Clicks: ' + IntToStr (FClicks);
end;

procedure TForm1.btnCreateFormClick(Sender: TObject);
begin
  with TForm1.Create (Self) do
    Show;
end;

end.
