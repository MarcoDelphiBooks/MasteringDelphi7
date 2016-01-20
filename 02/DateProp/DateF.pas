unit DateF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Dates, StdCtrls;

type
  TDateForm = class(TForm)
    BtnIncrease: TButton;
    EditYear: TEdit;
    EditMonth: TEdit;
    EditDay: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    BtnRead: TButton;
    BtnWrite: TButton;
    procedure BtnIncreaseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnReadClick(Sender: TObject);
    procedure BtnWriteClick(Sender: TObject);
  private
    TheDay: TDate;
  public
    { Public declarations }
  end;

var
  DateForm: TDateForm;

implementation

{$R *.DFM}

procedure TDateForm.FormCreate(Sender: TObject);
begin
  TheDay := TDate.Create;
  TheDay.SetValue (2003, 12, 25);
end;

procedure TDateForm.BtnIncreaseClick(Sender: TObject);
begin
  TheDay.Increase;
end;

procedure TDateForm.FormDestroy(Sender: TObject);
begin
  TheDay.Free;
end;

procedure TDateForm.BtnReadClick(Sender: TObject);
begin
  EditYear.Text := IntToStr (TheDay.Year);
  EditMonth.Text := IntToStr (TheDay.Month);
  EditDay.Text := IntToStr (TheDay.Day);
end;

procedure TDateForm.BtnWriteClick(Sender: TObject);
begin
  TheDay.SetValue (StrToInt (EditYear.Text),
    StrToInt (EditMonth.Text), StrToInt (EditDay.Text));
end;

end.

