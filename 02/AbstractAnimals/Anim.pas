unit Anim;

interface

type
  TAnimal = class
  public
    constructor Create;
    function GetKind: string;
    function Voice: string; virtual; abstract;
  private
    Kind: string;
  end;

  TDog = class (TAnimal)
  public
    constructor Create;
    function Voice: string; override;
    function Eat: string; virtual;
  end;

  TCat = class (TAnimal)
  public
    constructor Create;
    function Voice: string; override;
    function Eat: string; virtual;
  end;

implementation

uses
  MMSystem;

constructor TAnimal.Create;
begin
  Kind := 'An animal';
end;

function TAnimal.GetKind: string;
begin
  GetKind := Kind;
end;

constructor TDog.Create;
begin
  Kind := 'A dog';
end;

function TDog.Voice: string;
begin
  Voice := 'Arf Arf';
  PlaySound ('dog.wav', 0, snd_Async);
end;

function TDog.Eat: string;
begin
  Eat := 'A bone, please!';
end;

constructor TCat.Create;
begin
  Kind := 'A cat';
end;

function TCat.Voice: string;
begin
  Voice := 'Mieow';
  PlaySound ('cat.wav', 0, snd_Async);
end;

function TCat.Eat: string;
begin
  Eat := 'A mouse, please!';
end;

end.

