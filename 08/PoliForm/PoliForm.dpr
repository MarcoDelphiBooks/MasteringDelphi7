program PoliForm;

uses
  Forms,
  Viewer in 'Viewer.pas' {ViewerForm},
  TextView in 'TextView.pas' {TextViewerForm},
  Main in 'Main.pas' {MainForm},
  BmpView in 'BmpView.pas' {ImageViewerForm};

{$R *.RES}

begin
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
