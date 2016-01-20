program HelloWorld;

{$APPTYPE CONSOLE}

uses
  Borland.Delphi.SysUtils;

begin
  WriteLn ('Hello, Delphi! - Today is ' +
    DateToStr (Now));
end.

