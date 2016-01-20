unit NetNumberClass;

interface

type
  INumber = interface
    function GetValue: Integer;
    procedure SetValue (New: Integer);
    procedure Increase;
  end;

  TNumber = class(TObject, INumber)
  private
    fValue: Integer;
  public
    constructor Create;
    function GetValue: Integer;
    procedure SetValue (New: Integer);
    procedure Increase;
  end;

implementation

{ TNumber }

constructor TNumber.Create;
begin
  fValue := 10;
end;

function TNumber.GetValue: Integer;
begin
  Result := fValue;
end;

procedure TNumber.Increase;
begin
  Inc (fValue);
end;

procedure TNumber.SetValue(New: Integer);
begin
  fValue := New;
end;

end.
