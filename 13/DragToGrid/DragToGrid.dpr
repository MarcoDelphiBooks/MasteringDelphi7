program dragtogrid;

uses
  Forms,
  DragToGridForm in 'DragToGridForm.pas' {FormDrag};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormDrag, FormDrag);
  Application.Run;
end.
