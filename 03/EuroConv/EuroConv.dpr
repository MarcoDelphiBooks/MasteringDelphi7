program EuroConv;

uses
  Forms,
  EuroForm in 'EuroForm.pas' {Form1},
  EuroConvConst in 'EuroConvConst.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
