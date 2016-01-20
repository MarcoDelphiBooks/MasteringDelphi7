unit VclToClxForm;

interface

uses
  SysUtils, Types, Classes, QGraphics, QControls, QForms, QDialogs,
  QStdCtrls, QComCtrls {$IFDEF LINUX}, Libc{$ENDIF}  ;

type
  TForm1 = class(TForm)
    lbFiles: TListBox;
    btnSource: TButton;
    btnReplace: TButton;
    lvReplace: TListView;
    cbRecurse: TCheckBox;
    procedure btnSourceClick(Sender: TObject);
    procedure btnReplaceClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    ReplaceMap: TStringList;
    CurrentDir: string;
  public
    procedure AddFilesToList (Filter, Folder: string; Recurse: Boolean);
  end;

var
  Form1: TForm1;

procedure GetSubDirs (Folder: string; sList: TStringList);

implementation

{$R *.xfm}

procedure TForm1.AddFilesToList(Filter, Folder: string; Recurse: Boolean);
var
  sr: TSearchRec;
  sDirList: TStringList;
  i: Integer;
begin
  if FindFirst (Folder + Filter, faAnyFile, sr) = 0 then
  repeat
    lbFiles.Items.Add (Folder + sr.Name);
  until FindNext(sr) <> 0;
  FindClose(sr);
  if Recurse then
  begin
    sDirList := TStringList.Create;
    try
      GetSubDirs (Folder, sDirList);
      for i := 0 to sDirList.Count - 1 do
        if (sDirList[i] <> '.') and (sDirList[i] <> '..') then
        begin
          Application.ProcessMessages;
          AddFilesToList (Filter,
            IncludeTrailingPathDelimiter (Folder + sDirList[i]),
            Recurse);
        end;
    finally
      sDirList.Free;
    end;
  end;
end;

procedure TForm1.btnSourceClick(Sender: TObject);
var
  Dir: WideString;
begin
  if SelectDirectory ('Choose Folder', '', Dir) then
  begin
    {$IFDEF LINUX}
      if Dir [1] <> '/' then
        Dir := '/' + Dir;
    {$ENDIF}
    CurrentDir := Dir; // change current
    Dir := IncludeTrailingPathDelimiter(Dir);
    AddFilesToList ('*.dpr', Dir, cbRecurse.Checked);
    AddFilesToList ('*.pas', Dir, cbRecurse.Checked);
    AddFilesToList ('*.dfm', Dir, cbRecurse.Checked);    
  end;
end;

procedure TForm1.btnReplaceClick(Sender: TObject);
var
  StrFile: TStringList;
  i, j: Integer;
  FindStr, ReplaceStr: string;
begin
  strFile := TStringList.Create;
  for i := 0 to lbFiles.Items.Count - 1 do
  begin
    // convert DFM to xfm
    if SameText (ExtractFileExt(lbFiles.Items[i]), '.DFM') then
      RenameFile (lbFiles.Items[i],
        ChangeFileExt(lbFiles.Items[i], '.xfm'))
    else
    begin
      strFile.LoadFromFile(lbFiles.Items[i]);
      // for every string the the replace map
      for j := 0 to ReplaceMap.Count - 1 do
      begin
        // replace units inside uses (followed by ',')
        FindStr := ' ' + ReplaceMap.Names [j] + ',';
        ReplaceStr := ReplaceMap.Values [ReplaceMap.Names [j]];
        if ReplaceStr <> '' then
          ReplaceStr := ' ' + ReplaceStr + ',';
        strFile.Text := StringReplace (strFile.Text,
          FindStr, ReplaceStr, [rfReplaceAll]);
        // replace units at the end of uses (followed by ';')
        FindStr := ' ' + ReplaceMap.Names [j] + ';';
        ReplaceStr := ReplaceMap.Values [ReplaceMap.Names [j]];
        if ReplaceStr <> '' then
          ReplaceStr := ' ' + ReplaceStr + ';';
        strFile.Text := StringReplace (strFile.Text,
          FindStr, ReplaceStr, [rfReplaceAll]);
      end;
      // change DFM to xfm (lowercase)
      strFile.Text := StringReplace (strFile.Text,
        '.DFM', '.xfm', [rfReplaceAll]);
      // change RES to res (lowercase)
      strFile.Text := StringReplace (strFile.Text,
        '.RES', '.res', [rfReplaceAll]);
      strFile.SaveToFile(lbFiles.Items[i]);
    end;
  end;
  strFile.Free;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  i: Integer;
  Item: TListItem;
begin
  ReplaceMap := TStringList.Create;
  ReplaceMap.LoadFromFile (ExtractFilePath(Application.ExeName) + 'remap.conf');

  for i := 0 to ReplaceMap.Count - 1 do
  begin
    Item := lvReplace.Items.Add;
    Item.Caption := ReplaceMap.Names [i];
    Item.SubItems.Add (
      ReplaceMap.Values [ReplaceMap.Names [i]]);
  end;

  {$IFDEF LINUX}
  CurrentDir := '$HOME';
  {$ESLEIF}
  CurrentDir := 'C:\';
  {$ENDIF}
end;

{$IFDEF LINUX}
procedure GetSubDirs (Folder: string; sList: TStringList);
var
  p: Pointer;
  Scratch: TDirEnt;
  StatBuf: TStatBuf;
  PtrDirEnt: PDirEnt;
  Mode: mode_t;
  FName: string;
begin
  p := opendir(pChar(Folder));
  if p = nil then
    Exit;
  try
    readdir_r(p, @Scratch, PtrDirEnt);
    while PtrDirEnt <> nil do
    begin
      FName := Folder + string(PtrDirEnt.d_name);
      if lstat(PChar(FName), StatBuf) = 0 then
      begin
        Mode := StatBuf.st_mode;
        if Mode and S_IFDIR <> 0 then
          sList.Add (PtrDirEnt.d_name)
      end;
      readdir_r(p, @Scratch, PtrDirEnt);
    end;
  finally
    closedir(p);
  end;
end;
{$ENDIF}

{$IFDEF MSWINDOWS}
procedure GetSubDirs (Folder: string; sList: TStringList);
var
  sr: TSearchRec;
begin
  if FindFirst (Folder + '*.*', faDirectory, sr) = 0 then
  try
    repeat
      if (sr.Attr and faDirectory) = faDirectory then
        sList.Add (sr.Name);
    until FindNext(sr) <> 0;
  finally
    FindClose(sr);
  end;
end;
{$ENDIF}

end.
