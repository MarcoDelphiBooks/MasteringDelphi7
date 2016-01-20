unit DateF;

interface

{ Note: This program can be properly loaded in the
  Delphi IDE only after installing the TDate component
  included in the Dates.pas unit of this same folder.
  Use the Component | Install Component command to accomplish
  this, choosing the dclusr.dpk ("Borland Users Components")
  package -- or another package of yours. }

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
    EditMonth: TEdit;
    EditDay: TEdit;
    EditYear: TEdit;
    ButtonRead: TButton;
    ButtonWrite: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Date1: TDate;
    procedure BtnIncreaseClick(Sender: TObject);
    procedure BtnDecreaseClick(Sender: TObject);
    procedure BtnAdd10Click(Sender: TObject);
    procedure BtnSubtract10Click(Sender: TObject);
    procedure ButtonReadClick(Sender: TObject);
    procedure ButtonWriteClick(Sender: TObject);
    procedure Date1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DateForm: TDateForm;

implementation

{$R *.DFM}

procedure TDateForm.BtnIncreaseClick(Sender: TObject);
begin
  Date1.Increase;
end;

procedure TDateForm.BtnDecreaseClick(Sender: TObject);
begin
  Date1.Decrease;
end;

procedure TDateForm.BtnAdd10Click(Sender: TObject);
begin
  Date1.Increase (10);
end;

procedure TDateForm.BtnSubtract10Click(Sender: TObject);
begin
  Date1.Decrease (10);
end;

procedure TDateForm.ButtonReadClick(Sender: TObject);
begin
  EditYear.Text := IntToStr (Date1.Year);
  EditMonth.Text := IntToStr (Date1.Month);
  EditDay.Text := IntToStr (Date1.Day);
end;

procedure TDateForm.ButtonWriteClick(Sender: TObject);
begin
  Date1.SetValue (StrToInt (EditYear.Text),
    StrToInt (EditMonth.Text),
    StrToInt (EditDay.Text));
end;

procedure TDateForm.Date1Change(Sender: TObject);
begin
  LabelDate.Caption := Date1.Text;
end;

end.

