unit NumServ;

interface

uses
  Windows, ActiveX, ComObj, NumIntf;

type
  TNumServer = class(TComObject, INumberProp)
  private
    fValue: Integer;
  public
    function GetValue: Integer; virtual; stdcall;
    procedure SetValue (New: Integer); virtual; stdcall;
    procedure Increase; virtual; stdcall;
    procedure Initialize; override;
    destructor Destroy; override;
  end;

const
  Class_NumPropServer: TGUID =
    '{B165F7A1-DDF9-11D1-B9F1-004845400FAA}';

implementation

uses ComServ;

{ TNumServer }

destructor TNumServer.Destroy;
begin
  inherited;
  MessageBox (0, 'Object Destroyed',
    'TDLLNumber', mb_OK); // API call
end;

function TNumServer.GetValue: Integer;
begin
  Result := fValue;
end;

procedure TNumServer.Increase;
begin
  Inc (fValue);
end;

procedure TNumServer.Initialize;
begin
  inherited;
  fValue := 10;
end;

procedure TNumServer.SetValue(New: Integer);
begin
  fValue := New;
end;

initialization
  TComObjectFactory.Create(ComServer, TNumServer, Class_NumPropServer,
    'NumPropServer', 'Num Prop Server (Prop Com)', ciMultiInstance, tmSingle);
end.
