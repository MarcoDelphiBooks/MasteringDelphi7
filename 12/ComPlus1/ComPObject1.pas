unit ComPObject1;

interface

uses
  ActiveX, MtsObj, Mtx, ComObj, ComPlus1_TLB, StdVcl;

type
  TComPlus1Object = class(TMtsAutoObject, IComPlus1Object)
  private
    fValue: Integer;
  protected
    function AsString: WideString; safecall;
    function Get_Value: Integer; safecall;
    procedure Increase(Amount: Integer); safecall;
    procedure Set_Value(Value: Integer); safecall;
  end;

implementation

uses ComServ, SysUtils;

function TComPlus1Object.AsString: WideString;
begin
  Result := Format ('%n', [fValue*1.0]);
end;

function TComPlus1Object.Get_Value: Integer;
begin
  Result := fValue;
end;

procedure TComPlus1Object.Increase(Amount: Integer);
begin
  Inc (fValue, Amount);
end;

procedure TComPlus1Object.Set_Value(Value: Integer);
begin
  fValue := Value;
end;

initialization
  TAutoObjectFactory.Create(ComServer, TComPlus1Object, Class_ComPlus1Object,
    ciMultiInstance, tmApartment);
end.
