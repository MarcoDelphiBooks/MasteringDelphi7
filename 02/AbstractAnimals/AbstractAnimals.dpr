program AbstractAnimals;

uses
  Forms,
  AnimF in 'AnimF.pas' {FormAnimals},
  Anim in 'Anim.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormAnimals, FormAnimals);
  Application.Run;
end.

