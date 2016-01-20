unit CustQueDebugForm;

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
  CLASS_ComWebApp: TGUID = '{5FC0E475-D22F-4F74-885F-9AC148B3717A}';

initialization
  TWebAppAutoObjectFactory.Create(Class_ComWebApp,
    'CustQueP', 'CustQueP Object');

end.
