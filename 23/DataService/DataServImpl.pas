unit DataServImpl;

interface

uses
  InvokeRegistry, DataWm, DataServIntf;

type
  TCustomData = class (TInvokableClass, ICustomData)
  public
    function GetData: String; stdcall;
    function SendDelta(Delta: String): Boolean;
  end;

implementation

uses DBClient;

{ TCustomData }

function TCustomData.GetData: String;
begin
  WebModule1.Table1.Open;
//  WebModule1.ClientDataSet1.Open;
//  Result := WebModule1.ClientDataSet1.XMLData;
end;

function TCustomData.SendDelta(Delta: String): Boolean;
begin
{  WebModule1.Table1.Open;
  WebModule1.ClientDataSet1.Open;
  WebModule1.ClientDataSet2.XMLData := Delta;
  WebModule1.ClientDataSet1. Delta := WebModule1.ClientDataSet2.GetData;
  Result := WebModule1.ClientDataSet1.ApplyUpdates (-1);
}
  Result := False;
end;



initialization
  InvRegistry.RegisterInvokableClass (TCustomData);

end.
