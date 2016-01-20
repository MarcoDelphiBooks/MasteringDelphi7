program BmpViewer;

uses
  Forms,
  BmpViewForm in 'BmpViewForm.pas' {FormBmpViewer},
  BmpPreview in 'BmpPreview.pas' {PreviewForm};

{$R *.RES}

begin
  Application.CreateForm(TFormBmpViewer, FormBmpViewer);
  Application.CreateForm(TPreviewForm, PreviewForm);
  Application.Run;
end.
