{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J+,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}

unit SingleInstance;

interface

uses
  Classes, SysUtils;

type
  TOneTimeDataObserver = class (TObject)
  private
    FEnabled: Boolean;
    FOnUpdate: TNotifyEvent;
    procedure SetOnUpdate(const Value: TNotifyEvent);
  public
    constructor Create (anEvent: TNotifyEvent);
    procedure Update;
  published
    property Enabled: Boolean read FEnabled write FEnabled;
    property OnUpdate: TNotifyEvent read FOnUpdate write SetOnUpdate;
  end;

  TOneTimeData = class (TObject)
  private
    FGlobalCount: Integer;
    FObservers: TList;
    procedure SetGlobalCount(const Value: Integer);
  protected
    constructor CreateInstance;
    class function AccessInstance(Request: Integer): TOneTimeData;
  public
    constructor Create;
    destructor Destroy; override;
    class function Instance: TOneTimeData;
    procedure RegisterObserver(Observer: TOneTimeDataObserver);
    procedure PublishToObservers;
    class procedure ReleaseInstance;
    procedure UnregisterObserver(Observer: TOneTimeDataObserver);
    property GlobalCount: Integer read FGlobalCount write SetGlobalCount;
  end;

implementation

{ OneTimeData }

{
********************************* TOneTimeData *********************************
}
constructor TOneTimeData.Create;
begin
  inherited Create;
  raise Exception.CreateFmt('Access class %s through Instance only',
          [ClassName]);
end;

constructor TOneTimeData.CreateInstance;
begin
  inherited Create;
  FObservers := TList.Create;
end;

destructor TOneTimeData.Destroy;
begin
  if AccessInstance(0) = Self then AccessInstance(2);
  inherited Destroy;
end;

class function TOneTimeData.AccessInstance(Request: Integer): TOneTimeData;

  const FInstance: TOneTimeData = nil;

begin
  case Request of
    0 : ;
    1 : if not Assigned(FInstance) then FInstance := CreateInstance;
    2 : FInstance := nil;
  else
    raise Exception.CreateFmt('Illegal request %d in AccessInstance',
            [Request]);
  end;
  Result := FInstance;
end;

class function TOneTimeData.Instance: TOneTimeData;
begin
  Result := AccessInstance(1);
end;

procedure TOneTimeData.RegisterObserver(Observer: TOneTimeDataObserver);
begin
  if FObservers.IndexOf(Observer) = -1 then
    FObservers.Add(Observer);
end;

class procedure TOneTimeData.ReleaseInstance;
begin
  AccessInstance(0).Free;
end;

procedure TOneTimeData.SetGlobalCount(const Value: Integer);
begin
  FGlobalCount := Value;
  PublishToObservers;
end;

procedure TOneTimeData.UnregisterObserver(Observer: TOneTimeDataObserver);
begin
  FObservers.Remove(Observer);
end;

{ TOneTimeDataObserver }

constructor TOneTimeDataObserver.Create(anEvent: TNotifyEvent);
begin
  fOnUpdate := anEvent;
end;

procedure TOneTimeDataObserver.SetOnUpdate(const Value: TNotifyEvent);
begin
  FOnUpdate := Value;
end;

procedure TOneTimeDataObserver.Update;
begin
  if Assigned (fOnUpdate) then
    fOnUpdate (self);
end;

procedure TOneTimeData.PublishToObservers;
var
  I: Integer;
begin
  for I := 0 to FObservers.Count - 1 do
    TOneTimeDataObserver(FObservers [i]).Update;
end;

end.
