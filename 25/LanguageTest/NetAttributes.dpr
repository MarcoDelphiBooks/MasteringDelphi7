program NetAttributes;

uses
  Borland.Delphi.SysUtils;

type
  TMyCustomAttribute = class(TCustomAttribute)
  private
    FAttr : Integer;
  public
    constructor Create(val: Integer);
    property customAttribute : Integer read FAttr write FAttr;
  end;

  constructor TMyCustomAttribute.Create(val: Integer);
  begin
    inherited Create;
    customAttribute := val;
  end;

type
  [TMyCustomAttribute(17)]
  TFoo = class
  public
    Data : Integer;
  end;

var
  Foo: TFoo;

begin
  Foo := TFoo.Create;
  Foo.Data := 100;
  
  writeln ('hi, there');
end.

