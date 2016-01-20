program GarbageTest;

{$APPTYPE CONSOLE}

uses
  Borland.Delphi.SysUtils;

type
  // a class with large objects (about 10KB)
  TMyClass = class
  private
    data: Integer;
    list: array [1..10240] of Char;
    s: string;
  public
    constructor Create;
  end;

var
  mc: TMyClass;

{ TMyClass }

constructor TMyClass.Create;
begin
  inherited;
  // uses the data portion
  data := random (100);
  s := IntToStr (random (100));
  list [1+random (100)] := 'W';
end;

var
  i: Integer;

// array to keep all of the objects in memory
// objlist: array [1..10000] of TMyClass;

begin
  for i := 1 to 10000 do
  begin
    mc := TMyClass.Create;
    WriteLn (mc.s);
    // keep object in memory
    // objList [i] := mc;
    // remove objects after some time
    // if i > 10 then
    //   objList [i-5] := nil;
  end;
end.
