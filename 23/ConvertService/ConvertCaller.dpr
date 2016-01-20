program ConvertCaller;

uses
  Forms,
  CallerForm in 'CallerForm.pas' {Form1},
  ConvertIntf in 'ConvertIntf.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
