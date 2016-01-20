program ClassStatic;

{$APPTYPE CONSOLE}

uses
  Borland.Delphi.SysUtils;

type
  TBase = class
  public
    // class tmp: string;
    class procedure One;
    class static Procedure Two;
  end;

class procedure TBase.One;
begin
  // writeln (tmp);
  writeln ('one');
  writeln (ClassName);
end;

class static Procedure TBase.Two;
begin
  writeln ('two');
  // writeln (ClassName);
  //  Two;
end;

{type
  TMyClass = class
class private // can only be accessed within TMyClass
  // Class constructor must have class private visibility
  class constructor Create;
class protected // can be accessed in TMyClass and in descendants
  // Class static accessors for class static property P1, below
  class static function getP1 : Integer;
  class static procedure setP1(val : Integer);
public
  // fx can be called without an object instance
  class static function fx(p : Integer) : Integer;
  // Class static property P1 must have class static accessors
  class static property P1 : Integer read getP1 write setP1;
end;}

var
  base: TBase;

begin
  // TBase.tmp := 'hi';
  TBase.One;
  TBase.Two;
  base := TBase.Create;
  base.One;
  base.Two;
end.

