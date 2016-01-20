program EncDemo;

uses
  Forms,
  EncForm in 'EncForm.pas' {FormEncode},
  EncodStr in 'EncodStr.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFormEncode, FormEncode);
  Application.Run;
end.
