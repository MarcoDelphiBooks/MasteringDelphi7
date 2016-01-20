program nulldates;

uses
  Forms,
  NullDatesForm in 'NullDatesForm.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
