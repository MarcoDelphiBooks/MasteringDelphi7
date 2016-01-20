unit WvForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    btnVersion: TButton;
    btnPlatform: TButton;
    procedure btnVersionClick(Sender: TObject);
    procedure btnPlatformClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.btnVersionClick(Sender: TObject);
begin
  ShowMessage ('Running on Windows: ' +
    IntToStr (Win32MajorVersion) + '.' +
    IntToStr (Win32MinorVersion) + ' (Build ' +
    IntToStr (Win32BuildNumber) + ') ' + #10#13 +
    'Update: ' + Win32CSDVersion)
end;

procedure TForm1.btnPlatformClick(Sender: TObject);
begin
  case Win32Platform of
    VER_PLATFORM_WIN32_WINDOWS: ShowMessage ('Windows 9x');
    VER_PLATFORM_WIN32_NT: ShowMessage ('Windows NT');
  end;
end;

end.
