unit SoapEmployeeIntf;

interface

uses
  InvokeRegistry, Types, XSBuiltIns;

type
  ISoapEmployee = interface (IInvokable)
  ['{77D0D940-23EC-49A5-9630-ADE0751E3DB3}']
    function GetEmployeeNames: string; stdcall;
    function GetEmployeeData (EmpID: string): string; stdcall;
  end;

implementation

initialization
  InvRegistry.RegisterInterface (TypeInfo (ISoapEmployee));;

end.
