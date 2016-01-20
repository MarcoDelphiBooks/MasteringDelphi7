program QBorders;

uses
  QForms,
  BordersF in 'BordersF.pas' {Form1},
  Second in 'Second.pas' {Form2};

{$R *.res}

begin
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
