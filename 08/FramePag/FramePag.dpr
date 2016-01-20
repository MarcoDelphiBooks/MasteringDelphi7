program FramePag;

uses
  Forms,
  PageForm in 'PageForm.pas' {Form1},
  Frame2u in 'Frame2u.pas' {Frame2: TFrame},
  Frame3u in 'Frame3u.pas' {Frame3: TFrame};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
