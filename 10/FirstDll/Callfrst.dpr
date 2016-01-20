program Callfrst;

uses
  ShareMem,
  Forms,
  CallForm in 'CallForm.pas' {Form1};

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
