unit FilesListForm;

interface

{$WARN UNIT_PLATFORM OFF}
uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, FileCtrl;

type
  TForm1 = class(TForm)
    lbFiles: TListBox;
    btnSource: TButton;
    cbRecurse: TCheckBox;
    procedure btnSourceClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    CurrentDir: string;
    procedure AddFilesToList (Filter, Folder: string; Recurse: Boolean);
  public
    procedure AddDelphiFiles;
  end;

var
  Form1: TForm1;

procedure GetSubDirs (Folder: string; sList: TStringList);

implementation

{$R *.dfm}

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
          Update;
          lbFiles.Refresh;
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
  Dir: string;
begin
  Dir := CurrentDir;
  if SelectDirectory ('Choose Folder', '', Dir) then
  begin
    CurrentDir := Dir; // change current
    AddDelphiFiles;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  CurrentDir := ExtractFilePath (Application.ExeName);
end;

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

procedure TForm1.AddDelphiFiles;
begin
  Screen.Cursor := crHourGlass;
  try
    lbFiles.Clear;
    CurrentDir := IncludeTrailingPathDelimiter(CurrentDir);
    AddFilesToList ('*.dpr', CurrentDir, cbRecurse.Checked);
    AddFilesToList ('*.pas', CurrentDir, cbRecurse.Checked);
    AddFilesToList ('*.dfm', CurrentDir, cbRecurse.Checked);
  finally
    Screen.Cursor := crDefault;
  end;
end;

end.
