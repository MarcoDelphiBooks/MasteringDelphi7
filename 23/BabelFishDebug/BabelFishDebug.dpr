program BabelFishDebug;

uses
  Forms,
  BabelFishService in '..\BabelFish\BabelFishService.pas',
  BabelForm in 'BabelForm.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
