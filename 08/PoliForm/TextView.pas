unit TextView;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Viewer, StdCtrls, Menus, ExtCtrls;

type
  TTextViewerForm = class(TViewerForm)
    Memo1: TMemo;
    procedure ButtonLoadClick(Sender: TObject); override;
  private
    { Private declarations }
  public
    procedure LoadFile; override;
  end;

{var
  TextViewerForm: TTextViewerForm;}

implementation

{$R *.DFM}

procedure TTextViewerForm.ButtonLoadClick(Sender: TObject);
begin
//  inherited;
  if OpenDialog1.Execute then
    Memo1.Lines.LoadFromFile (OpenDialog1.Filename);
end;

procedure TTextViewerForm.LoadFile;
begin
  if OpenDialog1.Execute then
    Memo1.Lines.LoadFromFile (OpenDialog1.Filename);
end;

end.
