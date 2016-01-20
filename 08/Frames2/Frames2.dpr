program Frames2;

uses
  Forms,
  FramesForm in 'FramesForm.pas' {FormFrames},
  ListFrame in 'ListFrame.pas' {FrameList: TFrame};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFormFrames, FormFrames);
  Application.Run;
end.
