program MiniSize;

uses
  Windows;

{$R *.RES}

var
  nSize: Integer;
  hFile: THandle;
  // strSize2: String [20];
  strSize: String;
begin
  // base version

  // open the current file and read the size
  hFile := CreateFile (PChar (ParamStr (0)),
    0, FILE_SHARE_READ, nil, OPEN_EXISTING, 0, 0);
  nSize := GetFileSize (hFile, nil);
  CloseHandle (hFile);

  // copy the size to a string and show it
  SetLength (strSize, 20);
  Str (nSize, strSize);
  MessageBox (0, PChar(strSize), 'Mini Program', MB_OK);

{  // ultra-reduced version

  // open the current file and read the size
  hFile := CreateFile (@strSize2[1],
    0, FILE_SHARE_READ, nil, OPEN_EXISTING, 0, 0);
  nSize := GetFileSize (hFile, nil);
  CloseHandle (hFile);

  // copy the size to a string and show it
  MessageBox (0, @strSize2[1], 'Mini Program', MB_OK);}
end.



