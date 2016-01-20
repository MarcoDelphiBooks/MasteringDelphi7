{ Invokable interface ISoapFish }

unit SoapFishIntf;

interface

uses InvokeRegistry, Types, XSBuiltIns;

type
  { Invokable interfaces must derive from IInvokable }
  ISoapFish = interface(IInvokable)
  ['{4E4C57BF-4AC9-41C2-BB2A-64BCE470D450}']
    function GetCds: TSoapAttachment; stdcall;
    function GetImage(fishName: string): TSoapAttachment; stdcall;
  end;

implementation

initialization
  { Invokable interfaces must be registered }
  InvRegistry.RegisterInterface(TypeInfo(ISoapFish));

end.
