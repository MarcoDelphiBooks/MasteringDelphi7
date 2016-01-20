program FilesList;

uses
  Forms,
  FilesListForm in 'FilesListForm.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
