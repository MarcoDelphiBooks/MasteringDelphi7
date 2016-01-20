unit MainForm;

interface

uses
  SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

type
  TForm1 = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  SockApp;

{$R *.DFM}

initialization
  TWebAppSockObjectFactory.Create('WSnapUsers');

end.
