program Scroll2;

uses
  Forms,
  ScrollF in 'ScrollF.pas' {Form2};

{$R *.RES}

begin
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
