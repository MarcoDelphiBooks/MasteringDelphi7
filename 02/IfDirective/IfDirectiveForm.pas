unit IfDirectiveForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

{$DEFINE DEBUG}

const
  DebugControl = 2;

procedure TForm1.Button1Click(Sender: TObject);
begin
{$IF Defined(DEBUG) and (DebugControl > 3)}
  ShowMessage ('Executing critical code');
{$ELSE}
  ShowMessage ('Bye');
{$IFEND}

{$IF Defined(VER140)}
  ShowMessage ('Delphi6');
{$ELSE}
  ShowMessage ('Older Delphi');
{$IFEND}

{$IFDEF WINDOWS} // Wrong!!
  ShowMessage ('Windows 16');
{$ENDIF}

{$IFDEF MSWINDOWS}
  MessageBox (0, 'Windows Platform', 'Message', MB_OK);
{$ENDIF}

{$IFDEF WIN32}
  ShowMessage ('Win32');
{$ENDIF}

{$IFDEF LINUX}
  ShowMessage ('Linux');
{$ENDIF}

  ShowMessage (FloatToStr (System.RTLVersion));
end;

var
  WindowsVersion: Integer platform = 2000;

procedure Test; platform; // notice the semicolons
begin
  Beep;
end;

type
  TWinClass = class
    x: Integer;
  end library;

{$WARN SYMBOL_PLATFORM OFF}

procedure TForm1.Button2Click(Sender: TObject);
begin
  ShowMessage (
    IncludeTrailingBackSlash (ExtractFilePath (Application.ExeName)));
  Test;
  ShowMessage (IntToStr (WindowsVersion));
  TWinClass.Create;
  {$MESSAGE 'Old version of the unit: consider using the updated version'}
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  {$IFDEF ConditionalExpressions}
    {$IF System.RtlVersion > 14.0}
      ShowMessage ('RTL 14.0 or above');
    {$IFEND}
  {$ENDIF}
end;

end.
