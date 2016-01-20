unit DateF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Dates, StdCtrls;

type
  TDateForm = class(TForm)
    LabelDate: TLabel;
    BtnIncrease: TButton;
    BtnDecrease: TButton;
    BtnAdd10: TButton;
    BtnSubtract10: TButton;
    BtnLeap: TButton;
    BtnToday: TButton;
    procedure BtnIncreaseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnDecreaseClick(Sender: TObject);
    procedure BtnAdd10Click(Sender: TObject);
    procedure BtnSubtract10Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnLeapClick(Sender: TObject);
    procedure BtnTodayClick(Sender: TObject);
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
  TheDay := TDate.Create (2003, 12, 25);
  LabelDate.Caption := TheDay.GetText;
end;

procedure TDateForm.BtnIncreaseClick(Sender: TObject);
begin
  TheDay.Increase;
  LabelDate.Caption := TheDay.GetText;
end;

procedure TDateForm.BtnDecreaseClick(Sender: TObject);
begin
  TheDay.Decrease;
  LabelDate.Caption := TheDay.GetText;
end;

procedure TDateForm.BtnAdd10Click(Sender: TObject);
begin
  TheDay.Increase (10);
  LabelDate.Caption := TheDay.GetText;
end;

procedure TDateForm.BtnSubtract10Click(Sender: TObject);
begin
  TheDay.Decrease (10);
  LabelDate.Caption := TheDay.GetText;
end;

procedure TDateForm.FormDestroy(Sender: TObject);
begin
  TheDay.Free;
end;

procedure TDateForm.BtnLeapClick(Sender: TObject);
begin
  if TheDay.LeapYear then
    ShowMessage ('Leap year')
  else
    ShowMessage ('NON Leap year');
end;

procedure TDateForm.BtnTodayClick(Sender: TObject);
begin
  TheDay.SetValue (Date);
  LabelDate.Caption := TheDay.GetText;
end;

end.

