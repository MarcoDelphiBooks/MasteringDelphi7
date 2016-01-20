unit Dates;

interface

uses
  SysUtils;

type
  TDate = class
  private
    fDate: TDateTime;
    procedure SetDay(const Value: Integer);
    procedure SetMonth(const Value: Integer);
    procedure SetYear(const Value: Integer);
    function GetDay: Integer;
    function GetMonth: Integer;
    function GetYear: Integer;
  public
    procedure SetValue (y, m, d: Integer); overload;
    procedure SetValue (NewDate: TDateTime); overload;
    function LeapYear: Boolean;
    function GetText: string;
    procedure Increase;
    property Year: Integer read GetYear write SetYear;
    property Month: Integer read GetMonth write SetMonth;
    property Day: Integer read GetDay write SetDay;
  end;

implementation

uses
  DateUtils;

procedure TDate.SetValue (y, m, d: Integer);
begin
  fDate := EncodeDate (y, m, d);
end;

function TDate.GetText: string;
begin
  Result := DateToStr (fDate);
end;

procedure TDate.Increase;
begin
  fDate := fDate + 1;
end;

function TDate.LeapYear: Boolean;
begin
  // from DateUtils
  Result := IsInLeapYear(fDate);
end;

procedure TDate.SetValue(NewDate: TDateTime);
begin
  fDate := NewDate;
end;

procedure TDate.SetDay(const Value: Integer);
begin
  fDate := RecodeDay (fDate, Value);
end;

procedure TDate.SetMonth(const Value: Integer);
begin
  fDate := RecodeMonth (fDate, Value);
end;

procedure TDate.SetYear(const Value: Integer);
begin
  fDate := RecodeYear (fDate, Value);
end;

function TDate.GetDay: Integer;
begin
  Result := DayOf (fDate);
end;

function TDate.GetMonth: Integer;
begin
  Result := MonthOf (fDate);
end;

function TDate.GetYear: Integer;
begin
  Result := YearOf (fDate);
end;

end.

