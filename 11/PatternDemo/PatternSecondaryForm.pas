unit PatternSecondaryForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AnotherUpdate (Sender: TObject);
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses
  SingleInstance;

procedure TForm2.AnotherUpdate(Sender: TObject);
begin
  Label1.Caption := IntToStr (
    TOneTimeData.Instance.GlobalCount);
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  TOneTimeData.Instance.RegisterObserver(
    TOneTimeDataObserver.Create (AnotherUpdate));
end;

end.
