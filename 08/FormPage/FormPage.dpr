program FormPage;

uses
  Forms,
  FormPageForm in 'FormPageForm.pas' {Form1},
  FormInPage in 'FormInPage.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
