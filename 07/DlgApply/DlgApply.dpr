program DlgApply;

uses
  Forms,
  Main in 'Main.pas' {Form1},
  StyleD in 'StyleD.pas' {StyleDial},
  ListD in 'ListD.pas' {ListDial};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TStyleDial, StyleDial);
  Application.CreateForm(TListDial, ListDial);
  Application.Run;
end.

