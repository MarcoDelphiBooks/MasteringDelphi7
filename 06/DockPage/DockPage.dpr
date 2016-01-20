program DockPage;

uses
  Forms,
  DockPF in 'DockPF.pas' {Form1},
  EditForm in 'EditForm.pas' {Form2},
  CalForm in 'CalForm.pas' {Form3};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
