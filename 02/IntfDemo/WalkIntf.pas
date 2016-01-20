unit WalkIntf;

interface

type
  IWalker = interface
    ['{0876F200-AAD3-11D2-8551-CCA30C584521}']
    function Walk: string;
    function Run: string;
    procedure SetPos (Value: Integer);
    function GetPos: Integer;

    property Position: Integer
      read GetPos write SetPos;
  end;

  IJumper = interface
    ['{0876F201-AAD3-11D2-8551-CCA30C584521}']
    function Jump: string;
    function Walk: string;
    procedure SetPos (Value: Integer);
    function GetPos: Integer;

    property Position: Integer
      read GetPos write SetPos;
  end;

  TJumperImpl = class (TAggregatedObject, IJumper)
  private
    Pos: Integer;
  public
    function Jump: string;
    function Walk: string;
    procedure SetPos (Value: Integer);
    function GetPos: Integer;

    property Position: Integer
      read GetPos write SetPos;
  end;

  TRunner = class (TInterfacedObject, IWalker)
  private
    Pos: Integer;
  public
    function Walk: string;
    function Run: string;
    procedure SetPos (Value: Integer);
    function GetPos: Integer;
    destructor Destroy; override;
  end;

  TMyJumper = class (TInterfacedObject, IJumper)
  private
    fJumpImpl: TJumperImpl;
  public
    constructor Create;
    property Jumper: TJumperImpl
      read fJumpImpl implements IJumper;
    destructor Destroy; override;
  end;

  TAthlete = class (TInterfacedObject, IWalker, IJumper)
  private
    fJumpImpl: TJumperImpl;
  public
    constructor Create;
    destructor Destroy; override;
    function Run: string; virtual;
    function Walk1: string; virtual;
    function IWalker.Walk = Walk1;
    procedure SetPos (Value: Integer);
    function GetPos: Integer;

    property Jumper: TJumperImpl
      read fJumpImpl implements IJumper;
  end;

implementation

uses
  Dialogs, Windows, SysUtils;

{ TJumperImpl }

function TJumperImpl.Walk;
begin
  Inc (Pos);
  Result := IntToStr (Pos) + ': Walk';
end;

function TJumperImpl.Jump;
begin
  Inc (Pos, 3);
  Result := IntToStr (Pos) + ': Jump';
end;

function TJumperImpl.GetPos: Integer;
begin
  Result := Pos;
end;

procedure TJumperImpl.SetPos(Value: Integer);
begin
  Pos := Value;
end;

{ TAthlete }

constructor TAthlete.Create;
begin
  fJumpImpl := TJumperImpl.Create (self);
end;

destructor TAthlete.Destroy;
begin
  inherited;
  fJumpImpl.Free;
  MessageBox (0, 'TAthlete object destroyed', 'IntfDemo', MB_OK);
end;

function TAthlete.GetPos: Integer;
begin
  Result := fJumpImpl.Position;
end;

function TAthlete.Run;
begin
  fJumpImpl.Position := fJumpImpl.Position + 2;
  Result := IntToStr (fJumpImpl.Position) + ': Run';
end;

procedure TAthlete.SetPos(Value: Integer);
begin
  fJumpImpl.Position := Value;
end;

function TAthlete.Walk1;
begin
  fJumpImpl.Position := fJumpImpl.Position + 1;
  Result := IntToStr (fJumpImpl.Position) + ': Walk';
end;

{ TRunner }

destructor TRunner.Destroy;
begin
  inherited;
  MessageBox (0, 'TRunner object destroyed', 'IntfDemo', MB_OK);
end;

function TRunner.GetPos: Integer;
begin
  Result := Pos;
end;

function TRunner.Run;
begin
  Inc (Pos, 2);
  Result := IntToStr (Pos) + ': Run';
end;

procedure TRunner.SetPos(Value: Integer);
begin
  Pos := Value;
end;

function TRunner.Walk;
begin
  Inc (Pos);
  Result := IntToStr (Pos) + ': Walk';
end;

{ TMyJumper }

constructor TMyJumper.Create;
begin
  fJumpImpl := TJumperImpl.Create (self);
end;

destructor TMyJumper.Destroy;
begin
  inherited;
  fJumpImpl.Free;
  MessageBox (0, 'TMyJumper object destroyed', 'IntfDemo', MB_OK);
end;

end.
