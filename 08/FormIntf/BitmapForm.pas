unit BitmapForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormOperations, ExtDlgs, ExtCtrls, SaveStatusForms;

type
  TFormBitmap = class(TSaveStatusForm, IFormOperations)
    Image1: TImage;
    OpenPictureDialog1: TOpenPictureDialog;
    SavePictureDialog1: TSavePictureDialog;
  private
    { Private declarations }
  public
    procedure Load;
    procedure Save;
  end;

var
  FormBitmap: TFormBitmap;

implementation

{$R *.DFM}

{ TFormBitmap }

procedure TFormBitmap.Load;
begin
  if OpenPictureDialog1.Execute then
    Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
end;

procedure TFormBitmap.Save;
begin
  if SavePictureDialog1.Execute then
    Image1.Picture.SaveToFile(SavePictureDialog1.FileName);
end;

end.
