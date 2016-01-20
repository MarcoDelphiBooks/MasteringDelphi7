unit ConvertImpl;

interface

uses
  Classes, SysUtils, InvokeRegistry, ConvertIntf;

type
  TConvert = class (TInvokableClass, IConvert)
  protected
    function ConvertCurrency (Source, Dest: string; Amount: Double): Double; stdcall;
    function ToEuro (Source: string; Amount: Double): Double; stdcall;
    function FromEuro (Dest: string; Amount: Double): Double; stdcall;
    function TypesList: string; stdcall;    
  end;

implementation

uses
  ConvUtils, EuroConvConst;

{ TConvert }

function TConvert.ConvertCurrency(Source, Dest: string;
  Amount: Double): Double;
var
  BaseType, DestType: TConvType;
begin
  if DescriptionToConvType (cbEuroCurrency, Source, BaseType) and
      DescriptionToConvType (cbEuroCurrency, Dest, DestType) then
    Result := EuroConvert (Amount, BaseType, DestType, 4)
  else
    raise Exception.Create ('Undefined currency types');
end;

function TConvert.FromEuro(Dest: string; Amount: Double): Double;
var
  DestType: TConvType;
begin
  Result := 0;
  if DescriptionToConvType (cbEuroCurrency, Dest, DestType) then
    Result := EuroConvert (Amount, cuEUR, DestType, 4);
end;

function TConvert.ToEuro(Source: string; Amount: Double): Double;
var
  BaseType: TConvType;
begin
  Result := 0;
  if DescriptionToConvType (cbEuroCurrency, Source, BaseType) then
    Result := EuroConvert (Amount, BaseType, cuEUR, 4);
end;

function TConvert.TypesList: string;
var
  i: Integer;
  ATypes: TConvTypeArray;
begin
  Result := '';
  GetConvTypes(cbEuroCurrency, ATypes);
  for i := Low(aTypes) to High(aTypes) do
    Result := Result + ConvTypeToDescription (aTypes[i]) + ';';
end;

initialization
  InvRegistry.RegisterInvokableClass (TConvert);
end.

