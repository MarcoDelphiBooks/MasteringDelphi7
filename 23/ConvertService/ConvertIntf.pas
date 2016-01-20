unit ConvertIntf;

interface

type
  IConvert = interface(IInvokable)
  ['{FF1EAA45-0B94-4630-9A18-E768A91A78E2}']
    function ConvertCurrency (Source, Dest: string; Amount: Double): Double; stdcall;
    function ToEuro (Source: string; Amount: Double): Double; stdcall;
    function FromEuro (Dest: string; Amount: Double): Double; stdcall;
    function TypesList: string; stdcall;
end;

implementation

uses
  InvokeRegistry;

initialization
  InvRegistry.RegisterInterface(TypeInfo(IConvert));
end.
