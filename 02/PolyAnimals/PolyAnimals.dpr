program PolyAnimals;

uses
  Forms,
  AnimF in 'AnimF.pas' {FormAnimals},
  Anim in 'Anim.pas';

{$R *.res}

begin
  Application.CreateForm(TFormAnimals, FormAnimals);
  Application.Run;
end.

