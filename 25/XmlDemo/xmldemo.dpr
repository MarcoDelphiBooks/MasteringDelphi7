Program xmldemo;

uses
  System.Windows.Forms,
  Borland.Delphi.SysUtils,
  xmlform in 'xmlform.pas';

var
  aForm: TMyForm;

begin
  aForm := TMyForm.Create;
  Application.Run (aForm);
end.

