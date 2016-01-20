unit WSnapForm;

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
  CLASS_ComWebApp: TGUID = '{B404078F-9948-4F04-99CB-3CA072D43A56}';

initialization
  TWebAppAutoObjectFactory.Create(Class_ComWebApp,
    'WSnap2', 'WSnap1 Object');

end.
