program Delegate;

{$APPTYPE CONSOLE}

uses
  Borland.Delphi.SysUtils,
  System.Threading;

type
  TMyClass = class
  public
    procedure myMethod;
  end;

var
	threadDelegate: System.Threading.ThreadStart;
  aThread: System.Threading.Thread;
	tmc: TMyClass;

{ TMyClass }

procedure TMyClass.myMethod;
begin
  // some code goes here
  WriteLn ('Executing event handler');
end;

begin
	tmc := TMyClass.Create;
	threadDelegate := @tmc.myMethod;
  aThread := Thread.Create (threadDelegate);
  aThread.Start;

end.

