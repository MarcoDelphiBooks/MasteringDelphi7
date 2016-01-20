unit serverform;

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
  CLASS_ComWebApp: TGUID = '{833BAD2A-CA3F-4194-A0BA-FD57D46EDC16}';

initialization
  TWebAppAutoObjectFactory.Create(Class_ComWebApp,
    'SoapDataServer', 'SoapDataServer Object');

end.
