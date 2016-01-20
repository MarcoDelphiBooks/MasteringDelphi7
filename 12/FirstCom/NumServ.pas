unit NumServ;

interface

uses
  Windows, ActiveX, ComObj, NumIntf;

type
  TNumber = class(TComObject, INumber)
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
  Class_Number: TGUID = '{5B2EF181-3AAE-11D3-B9F1-00000100A27B}';

implementation

uses ComServ;

{ TNumber }

destructor TNumber.Destroy;
begin
  inherited;
  MessageBox (0, 'Object Destroyed',
    'TDLLNumber', mb_OK); // API call
end;

function TNumber.GetValue: Integer;
begin
  Result := fValue;
end;

procedure TNumber.Increase;
begin
  Inc (fValue);
end;

procedure TNumber.Initialize;
begin
  inherited;
  fValue := 10;
end;

procedure TNumber.SetValue(New: Integer);
begin
  fValue := New;
end;

initialization
  TComObjectFactory.Create(ComServer, TNumber, Class_Number,
    'Number', 'Number Server', ciMultiInstance, tmApartment);
end.
