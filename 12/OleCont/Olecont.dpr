program Olecont;

uses
  Forms,
  OleForm in 'OleForm.pas' {Form1};

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
