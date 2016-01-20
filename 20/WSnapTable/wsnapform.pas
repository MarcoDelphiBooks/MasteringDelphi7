unit wsnapform;

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
  CLASS_ComWebApp: TGUID = '{80D1D620-FE41-4FD0-BE34-9CB073C0635F}';

initialization
  TWebAppAutoObjectFactory.Create(Class_ComWebApp,
    'WSnapTable', 'WSnapTable Object');

end.
