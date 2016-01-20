program DragTree;

uses
  Forms,
  TreeForm in 'TreeForm.pas' {Form1};

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
