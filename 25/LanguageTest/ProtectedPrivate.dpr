program ProtectedPrivate;

uses
  Borland.Delphi.SysUtils;

type
  TBase = class
  private
    one: Integer;
  // class private
  class protected
    two: integer;
  end;

  TDeriv = class (TBase)
  public
    procedure Test;
  end;

procedure TDeriv.Test;
begin
  writeln (one + two);
end;

var
  deriv: TDeriv;
  base: TBase;

begin
  base := TBase.Create;
  deriv := TDeriv.Create;
  base.one := 10;
  // base.two := 30; // error: undeclared identifier
  deriv.one := 10;
  // deriv.two := 30; // error: undeclared identifier
end.

