unit DllMemU;

interface

uses
  Windows, SysUtils;

procedure SetData (I: Integer); stdcall;
function GetData: Integer; stdcall;
procedure SetShareData (I: Integer); stdcall;
function GetShareData: Integer; stdcall;

implementation

// global DLL data
var
  PlainData: Integer = 0; // not shared
  ShareData: ^Integer; // shared
  hMapFile: THandle;

const
  VirtualFileName = 'ShareDllData';
  DataSize = sizeof (Integer);

// plain (non shared) data read and write

procedure SetData (I: Integer); stdcall;
begin
  PlainData := I;
end;

function GetData: Integer; stdcall;
begin
  Result := PlainData;
end;

// shared data read and write

procedure SetShareData (I: Integer); stdcall;
begin
  ShareData^ := I;
end;

function GetShareData: Integer; stdcall;
begin
  Result := ShareData^;
end;

initialization
  //create memory mapped file
  hMapFile := CreateFileMapping ($FFFFFFFF, nil,
    Page_ReadWrite, 0, DataSize, VirtualFileName);
  if hMapFile = 0 then
    raise Exception.Create ('Error creating memory mapped file');
  // get the pointer to the actual data
  ShareData := MapViewOfFile (
    hMapFile, File_Map_Write, 0, 0, DataSize);

finalization
  UnmapViewOfFile (ShareData);
  CloseHandle (hMapFile);
end.
