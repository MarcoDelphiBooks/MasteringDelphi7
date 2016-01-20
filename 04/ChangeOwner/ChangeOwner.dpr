program ChangeOwner;

uses
  Forms,
  ChOwn1 in 'ChOwn1.pas' {Form1},
  ChOwn2 in 'ChOwn2.pas' {Form2};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
