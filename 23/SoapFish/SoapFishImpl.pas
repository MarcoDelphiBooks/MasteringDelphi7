{ Invokable implementation File for TSoapFish which implements ISoapFish }

unit SoapFishImpl;

interface

uses InvokeRegistry, Types, XSBuiltIns, SoapFishIntf;

type
  { TSoapFish }
  TSoapFish = class(TInvokableClass, ISoapFish)
  public
    function GetCds: TSoapAttachment; stdcall;
    function GetImage(fishName: string): TSoapAttachment; stdcall;
  end;

implementation

uses
  SoapFishModule, Classes;

{ TSoapFish }

function TSoapFish.GetCds: TSoapAttachment; stdcall;
var
  memStr: TMemoryStream;
begin
  Result := TSoapAttachment.Create;
  memStr := TMemoryStream.Create;
  WebModule2.cdsFish.SaveToStream(MemStr); // binary
  Result.SetSourceStream (memStr, soReference);
end;

function TSoapFish.GetImage(fishName: string): TSoapAttachment; stdcall;
var
  memStr: TMemoryStream;
begin
  WebModule2.cdsFish.Locate('Common_Name', fishName, []);
  Result := TSoapAttachment.Create;
  memStr := TMemoryStream.Create;
  WebModule2.cdsFishGraphic.GraphicHeader := True;
  WebModule2.cdsFishGraphic.SaveToStream(memStr);
  Result.SetSourceStream (memStr, soReference);
end;

initialization
  { Invokable classes must be registered }
  InvRegistry.RegisterInvokableClass(TSoapFish);

end.
