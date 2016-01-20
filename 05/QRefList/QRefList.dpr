program QRefList;

uses
  QForms,
  RefForm in 'RefForm.pas' {Form1};

{$R *.res}

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
