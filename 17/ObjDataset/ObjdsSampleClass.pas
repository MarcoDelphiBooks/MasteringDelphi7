unit ObjdsSampleClass;

interface

uses
  SysUtils, Classes;

type
  TDemo = class (TPersistent)
  private
    FAmount: Double;
    FAge: Integer;
    FName: string;
    FValue: INteger;
    procedure SetAge(const Value: Integer);
    procedure SetName(const Value: string);
    procedure SetAmount(const Value: Double);
    procedure SetValue(const Value: INteger);
  public
    function Description: string;
  published
    property Name: string read FName write SetName;
    property Age: Integer read FAge write SetAge;
    property Amount: Double read FAmount write SetAmount;
    property Value: INteger read FValue write SetValue;
  end;

implementation

{ TDemo }

function TDemo.Description: string;
begin
  Result := Format ('Name: %s, Age: %d, Value: %n',
    [fName, FAge, FAmount]);
end;

procedure TDemo.SetAge(const Value: Integer);
begin
  if Value < 100 then
    FAge := Value
  else
    Raise Exception.Create ('more than 100 years');
end;

procedure TDemo.SetName(const Value: string);
begin
  FName := Value;
end;

procedure TDemo.SetAmount(const Value: Double);
begin
  FAmount := Value;
end;

procedure TDemo.SetValue(const Value: INteger);
begin
  if Value > 1000 then
    raise exception.Create ('too large'); 
  FValue := Value;
end;

end.
