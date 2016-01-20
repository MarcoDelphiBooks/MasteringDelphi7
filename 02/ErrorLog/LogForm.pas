unit LogForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, AppEvnts;

type
  TFormLog = class(TForm)
    Button1: TButton;
    Button2: TButton;
    CheckBoxSilent: TCheckBox;
    ApplicationEvents1: TApplicationEvents;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure LogException (Sender: TObject; E: Exception);
  end;

var
  FormLog: TFormLog;

implementation

{$R *.DFM}

procedure TFormLog.LogException(Sender: TObject; E: Exception);
var
  Filename: string;
  LogFile: TextFile;
begin
  // prepares log file
  Filename := ChangeFileExt (Application.Exename, '.log');
  AssignFile (LogFile, Filename);
  if FileExists (FileName) then
    Append (LogFile) // open existing file
  else
    Rewrite (LogFile); // create a new one
  try
    // write to the file and show error
    Writeln (LogFile, DateTimeToStr (Now) + ':' + E.Message);
    if not CheckBoxSilent.Checked then
      Application.ShowException (E);
  finally
    // close the file
    CloseFile (LogFile);
  end;
end;

procedure TFormLog.Button1Click(Sender: TObject);
var
  a, b, c: Integer;
begin
  a := 10;
  b := 0;
  c := a div b;
  ShowMessage (IntToStr (c));
end;

procedure TFormLog.Button2Click(Sender: TObject);
begin
  raise Exception.Create ('raise button pressed');
end;

end.
