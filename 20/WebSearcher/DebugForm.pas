unit DebugForm;

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

uses ComApp;

{$R *.DFM}

const
  CLASS_ComWebApp: TGUID = '{57D1EA50-A52F-49C2-8EE0-343E29586541}';

initialization
  TWebAppAutoObjectFactory.Create(Class_ComWebApp,
    'websearchdemo', 'websearchdemo Object');

end.
