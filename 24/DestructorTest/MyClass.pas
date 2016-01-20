unit MyClass;

interface

type
  TMyClass = class
  public
    destructor Destroy; override;
  end;

implementation

destructor TMyClass.Destroy;
begin
  WriteLn ('In destructor (which is actually the IDisposable.Dispose method)');
end;

end.

 