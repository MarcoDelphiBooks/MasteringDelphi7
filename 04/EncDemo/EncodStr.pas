unit EncodStr;

interface

uses
  Classes;

type
  TEncodedStream = class (TFileStream)
  private
    FKey: Char;
  public
    constructor Create(const FileName: string; Mode: Word);
    function Read(var Buffer; Count: Longint): Longint; override;
    function Write(const Buffer; Count: Longint): Longint; override;
    property Key: Char read FKey write FKey default 'A';
  end;

implementation

constructor TEncodedStream.Create(
  const FileName: string; Mode: Word);
begin
  inherited Create (FileName, Mode);
  FKey := 'A';
end;

function TEncodedStream.Write(const Buffer; 
  Count: Longint): Longint;
var
  pBuf, pEnc: PChar;
  I, EncVal: Integer;
begin
  // allocate memory for the encoded buffer
  GetMem (pEnc, Count);
  try
    // use the buffer as an array of characters
    pBuf := PChar (@Buffer);
    // for every character of the buffer
    for I := 0 to Count - 1 do
    begin
      // encode the value and store it
      EncVal := ( Ord (pBuf[I]) + Ord(Key) ) mod 256;
      pEnc [I] := Chr (EncVal);
    end;
    // write the encoded buffer to the file
    Result := inherited Write (pEnc^, Count);
  finally
    FreeMem (pEnc, Count);
  end;
end;

function TEncodedStream.Read(var Buffer; Count: Longint): Longint;
var
  pBuf, pEnc: PChar;
  I, CountRead, EncVal: Integer;
begin
  // allocate memory for the encoded buffer
  GetMem (pEnc, Count);
  try
    // read the encoded buffer from the file
    CountRead := inherited Read (pEnc^, Count);
    // use the output buffer as a string
    pBuf := PChar (@Buffer);
    // for every character actually read
    for I := 0 to CountRead - 1 do
    begin
      // decode the value and store it
      EncVal := ( Ord (pEnc[I]) - Ord(Key) ) mod 256;
      pBuf [I] := Chr (EncVal);
    end;
  finally
    FreeMem (pEnc, Count);
  end;
  // return the number of characters read
  Result := CountRead;
end;



end.
