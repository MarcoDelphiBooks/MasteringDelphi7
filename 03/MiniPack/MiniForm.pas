unit MiniForm;

interface

uses
  Windows, Forms;

type
  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
var
  nSize: Integer;
  hFile: THandle;
  strSize: String;

begin
  hFile := CreateFile (PChar (ParamStr (0)),
    0, FILE_SHARE_READ, nil, OPEN_EXISTING, 0, 0);
  nSize := GetFileSize (hFile, nil);
  CloseHandle (hFile);

  SetLength (strSize, 20);
  Str (nSize, strSize);

  Caption := 'Size = ' + strSize;
end;

end.
