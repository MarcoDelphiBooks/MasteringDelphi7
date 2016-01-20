program ColorKeyHole;

uses
  Forms,
  CkForm in 'CkForm.pas' {Form1},
  AlphaForm in 'AlphaForm.pas' {Form2},
  PlainForm in 'PlainForm.pas' {Form3};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
