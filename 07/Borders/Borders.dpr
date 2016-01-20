program Borders;

uses
  Forms,
  BordersF in 'BordersF.pas' {Form1},
  Second in 'Second.pas' {Form2};

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
