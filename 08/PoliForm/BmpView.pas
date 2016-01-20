unit BmpView;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Viewer, ExtCtrls, Menus, StdCtrls;

type
  TImageViewerForm = class(TViewerForm)
    Image1: TImage;
    procedure ButtonLoadClick(Sender: TObject); override;
  private
    { Private declarations }
  public
    procedure LoadFile; override;
  end;

{var
  ImageViewerForm: TImageViewerForm;}

implementation

{$R *.DFM}

procedure TImageViewerForm.ButtonLoadClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
    Image1.Picture.LoadFromFile (OpenDialog1.Filename);
end;

procedure TImageViewerForm.LoadFile;
begin
  if OpenDialog1.Execute then
    Image1.Picture.LoadFromFile (OpenDialog1.Filename);
end;

end.
