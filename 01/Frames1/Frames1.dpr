program Frames1;

uses
  Forms,
  Form in 'Form.pas' {Form1},
  Frame in 'Frame.pas' {Frame1: TFrame};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
