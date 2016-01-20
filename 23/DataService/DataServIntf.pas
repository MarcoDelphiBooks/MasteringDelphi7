unit DataServIntf;

interface

type
  ICustomData = interface (IInvokable)
  ['{890B77BE-661E-4301-8A29-0B8274D27116}']
    function GetData: string; stdcall;
    function SendDelta (Delta: string): Boolean;
  end;

implementation

uses
  InvokeRegistry;

initialization
  InvRegistry.RegisterInterface(TypeInfo(ICustomData));

end.
