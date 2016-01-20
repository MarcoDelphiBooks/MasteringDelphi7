program DestructorTest;

{$APPTYPE CONSOLE}

uses
  MyClass in 'MyClass.pas';

var
  test : TMyClass;

begin
  WriteLn ('DestructorTest starts');
  test := TMyClass.Create;
  test.Free;
  WriteLn ('DestructorTest ends');
end.
