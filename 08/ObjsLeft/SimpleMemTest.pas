unit SimpleMemTest;

interface

implementation

uses
  Windows;

var
  msg: string;

initialization

finalization

  if AllocMemCount > 0 then
  begin
    Str (AllocMemCount, msg);
    msg := msg + ' heap blocks left';
    MessageBox (0, PChar(msg), 'Memory Leak', MB_OK);
  end;

end.
 