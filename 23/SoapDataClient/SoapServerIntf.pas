unit SoapServerIntf;

interface

uses
  Classes, SoapConn, Rio, SoapHTTPClient,
  Midas, InvokeRegistry;

type
  ISoapTestDm = interface(IAppServer)
    ['{58C71945-696E-45EA-A716-765ABEAF1C5E}']
    function GetRecordCount: Integer;
  end;

implementation

initialization
//  InvRegistry.RegisterInterface(TypeInfo(IAppServer));
  InvRegistry.RegisterInterface(TypeInfo(ISoapTestDm));

end.

