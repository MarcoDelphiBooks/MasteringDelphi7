program LibComp;

uses
  Forms,
  LibCompForm in 'LibCompForm.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
