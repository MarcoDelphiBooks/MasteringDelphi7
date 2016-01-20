program StreamDsDemo;

uses
  Forms,
  StreamDsForm in 'StreamDsForm.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
 end.
