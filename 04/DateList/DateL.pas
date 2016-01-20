unit DateL;

interface

uses
  Classes, Dates, Contnrs;

type
  // inheritance based
  TDateListI = class (TObjectList)
  protected
    procedure SetObject (Index: Integer; Item: TDate);
    function GetObject (Index: Integer): TDate;
  public
    function Add (Obj: TDate): Integer;
    procedure Insert (Index: Integer; Obj: TDate);
    property Objects [Index: Integer]: TDate
      read GetObject write SetObject; default;
  end;
  // wrapper based
  TDateListW = class(TObject)
  private
    FList: TObjectList;
    procedure SetObject (Index: Integer; Obj: TDate);
    function GetObject (Index: Integer): TDate;
    function GetCount: Integer;
  public
    constructor Create;
    destructor Destroy; override;
    function Add (Obj: TDate): Integer;
    function Remove (Obj: TDate): Integer;
    function IndexOf (Obj: TDate): Integer;
    property Count: Integer read GetCount;
    property Objects [Index: Integer]: TDate
      read GetObject write SetObject; default;
  end;

implementation

// inherited version

function TDateListI.Add (Obj: TDate): Integer;
begin
  Result := inherited Add (Obj)
end;

procedure TDateListI.SetObject (Index: Integer; Item: TDate);
begin
  inherited SetItem (Index, Item)
end;

function TDateListI.GetObject (Index: Integer): TDate;
begin
  Result := inherited GetItem (Index) as TDate;
end;

procedure TDateListI.Insert(Index: Integer; Obj: TDate);
begin
  inherited Insert(Index, Obj);
end;

// embedded version

constructor TDateListW.Create;
begin
  inherited Create;
  FList := TObjectList.Create;
end;

destructor TDateListW.Destroy;
begin
  FList.Free;
  inherited Destroy;
end;

function TDateListW.GetObject (Index: Integer): TDate;
begin
  Result := FList [Index] as TDate;
end;

procedure TDateListW.SetObject (Index: Integer; Obj: TDate);
begin
  FList[Index] := Obj;
end;

function TDateListW.GetCount: Integer;
begin
  Result := FList.Count;
end;

function TDateListW.Add (Obj: TDate): Integer;
begin
  Result := FList.Add (Obj);
end;

// another method you can optionally add
{function TDateListW.Equals(List: TDateListW): Boolean;
var
  I: Integer;
begin
  Result := False;
  if List.Count <> FList.Count then Exit;
  for I := 0 to List.Count - 1 do
    if List[I] <> FList[I] then
      Exit;
  Result := True;
end;}

function TDateListW.IndexOf(Obj: TDate): Integer;
begin
  Result := fList.IndexOf (Obj);
end;

// another method you can optionally add
{procedure TDateListW.Insert(Index: Integer; Obj: TDate);
begin
  fList.Insert (Index, Obj);
end;}

function TDateListW.Remove(Obj: TDate): Integer;
begin
  Result := fList.Remove (Obj);
end;

end.
