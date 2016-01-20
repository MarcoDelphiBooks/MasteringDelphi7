program HelloWin;

uses
  System.Windows.Forms,
  Borland.Delphi.SysUtils;

var
  aForm: Form;

begin
  aForm := Form.Create;
  aForm.Text := 'Hello, Delphi';
  Application.Run (aForm);
end.

