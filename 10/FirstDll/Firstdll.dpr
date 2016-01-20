library Firstdll;

{changing the uses statement, as suggested in
the comments, the size of the DLL changes}

{uses
  ShareMem, SysUtils, Dialogs; // larger code}
uses
  ShareMem, SysUtils, Windows; // minimal

function Triple (C: Char): Integer; stdcall; overload;
begin
  try
    // ShowMessage ('Triple (Char) function called');
    MessageBox (0, 'Triple function called',
      'First DLL', mb_OK);
    Result := Ord (C) * 3;
  except
    Result := -1;
  end;
end;

function Triple (N: Integer): Integer; stdcall; overload;
begin
  try
    // ShowMessage ('Triple function called');
    MessageBox (0, 'Triple function called',
      'First DLL', mb_OK);
    Result := N * 3;
  except
    Result := -1;
  end;
end;

function Double (N: Integer): Integer; stdcall;
begin
  try
    // ShowMessage ('Double function called');
    // MessageBox (0, 'Double function called',
    //  'First DLL', mb_OK);
    Result := N * 2;
  except
    Result := -1;
  end;
end;

function DoubleString (S: string; Separator: Char): string; stdcall;
begin
  try
    Result := S + Separator + S;
  except
    Result := '[error]';
  end;
end;

function DoublePChar (BufferIn, BufferOut: PChar;
  BufferOutLen: Cardinal; Separator: Char): LongBool; stdcall;
var
  SepStr: array [0..1] of Char;
begin
  try
    // if the buffer is large enough
    if BufferOutLen > StrLen (BufferIn) * 2 + 2 then
    begin
      // copy the input buffer in the output buffer
      StrCopy (BufferOut, BufferIn);
      // build the separator string (value plus null terminator)
      SepStr [0] := Separator;
      SepStr [1] := #0;
      // append the separator
      StrCat (BufferOut, SepStr);
      // append the input buffer once more
      StrCat (BufferOut, BufferIn);
      Result := True;
    end
    else
      // not enough space
      Result := False;
  except
    Result := False;
  end;
end;

exports
  Triple (N: Integer),
  Triple (C: Char) name 'TripleChar',
  Double, DoubleString, DoublePChar;

end.
