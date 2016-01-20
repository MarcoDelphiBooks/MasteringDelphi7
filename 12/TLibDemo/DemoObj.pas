unit DemoObj;

interface

uses
  ComObj, Tlibdemo_TLB, StdVcl;

type
  TFirstServer = class(TAutoObject, IFirstServer)
  protected
    function Get_Value: Integer; safecall;
    procedure ChangeColor; safecall;
    procedure Set_Value(Value: Integer); safecall;
  end;

implementation

uses ComServ, MainForm;

function TFirstServer.Get_Value: Integer;
begin
  Result := ServerForm.Value;
end;

procedure TFirstServer.ChangeColor;
begin
  ServerForm.ChangeColor;
end;

procedure TFirstServer.Set_Value(Value: Integer);
begin
  ServerForm.Value := Value;
end;

initialization
  TAutoObjectFactory.Create(ComServer, TFirstServer,
    Class_FirstServer, ciMultiInstance);
end.
