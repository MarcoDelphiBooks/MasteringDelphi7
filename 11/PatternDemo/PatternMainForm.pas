unit PatternMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure OnUpdate (Sender: TObject);
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  SingleInstance;

procedure TForm1.FormCreate(Sender: TObject);
begin
  TOneTimeData.Instance.RegisterObserver(
    TOneTimeDataObserver.Create (OnUpdate));
end;

procedure TForm1.OnUpdate(Sender: TObject);
begin
  Caption := 'Count = ' + IntToStr (
    TOneTimeData.Instance.GlobalCount);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  TOneTimeData.Instance.GlobalCount := Random (1000);
end;

initialization
  Randomize;

end.
