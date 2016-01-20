unit MonForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IBSQLMonitor, StdCtrls, ComCtrls, ExtCtrls, IBServices, ToolWin;

type
  TForm1 = class(TForm)
    IBSQLMonitor1: TIBSQLMonitor;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    RichEdit1: TRichEdit;
    IBStatisticalService1: TIBStatisticalService;
    IBServerProperties1: TIBServerProperties;
    RichEdit2: TRichEdit;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolBar2: TToolBar;
    ToolButton2: TToolButton;
    RichEdit3: TRichEdit;
    RichEdit4: TRichEdit;
    ToolBar3: TToolBar;
    ToolButton3: TToolButton;
    IBSecurityService1: TIBSecurityService;
    procedure IBSQLMonitor1SQL(EventText: String; EventTime: TDateTime);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.IBSQLMonitor1SQL(EventText: String;
  EventTime: TDateTime);
begin
  if Assigned (RichEdit1) then
    RichEdit1.Lines.Add (TimeToStr (EventTime) + ': ' + EventText);
end;

procedure TForm1.ToolButton1Click(Sender: TObject);
begin
  RichEdit2.Clear;
  RichEdit2.Lines.Add ('Statistical Service -- ' + TimeToStr (Now));
  IBStatisticalService1.ServiceStart;
  while not IBStatisticalService1.EOF do
    RichEdit2.Lines.Add (IBStatisticalService1.GetNextChunk);
end;

procedure TForm1.ToolButton2Click(Sender: TObject);
var
  i, n: Integer;
begin
  RichEdit3.Clear;
  RichEdit3.Lines.Add ('Server Properties -- ' + TimeToStr (Now));
  RichEdit3.Lines.Add ('');

  IBServerProperties1.FetchDatabaseInfo;
  n := IBServerProperties1.DatabaseInfo.NoOfDatabases;
  RichEdit3.Lines.Add ('Databases: ' + IntToStr (n));
  for i := 0 to n-1 do
    RichEdit3.Lines.Add ('- ' + IBServerProperties1.DatabaseInfo.DbName[i]);
  RichEdit3.Lines.Add ('');

  IBServerProperties1.FetchConfigParams;
  RichEdit3.Lines.Add ('Base Location: ' +
    IBServerProperties1.ConfigParams.BaseLocation);
  RichEdit3.Lines.Add ('');

  IBServerProperties1.FetchVersionInfo;
  with IBServerProperties1.VersionInfo do
  begin
    RichEdit3.Lines.Add ('Version: ' + ServerVersion);
    RichEdit3.Lines.Add ('Implementation: ' + ServerImplementation);
    RichEdit3.Lines.Add ('Service Version: ' + IntToStr (ServiceVersion));
  end;
end;

procedure TForm1.ToolButton3Click(Sender: TObject);
var
  i: Integer;
begin
  RichEdit4.Clear;
  // grab the user's data
  IBSecurityService1.DisplayUsers;
  // display the name of each user
  for i := 0 to IBSecurityService1.UserInfoCount - 1 do
    with IBSecurityService1.UserInfo[i] do
      RichEdit4.Lines.Add (Format (
        'User: %s, Full Name: %s, Id: %d',
        [UserName, FirstName + ' ' + LastName, UserId]));
end;

end.
