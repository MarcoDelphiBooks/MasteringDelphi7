program UniPrint;

uses
  Forms,
  UniPrintForm in 'UniPrintForm.pas' {Navigator};

{$R *.RES}

begin
  Application.CreateForm(TNavigator, Navigator);
  Application.Run;
end.
