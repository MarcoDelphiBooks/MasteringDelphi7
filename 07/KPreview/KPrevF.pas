unit KPrevF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    RadioPreview: TRadioGroup;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    procedure RadioPreviewClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.RadioPreviewClick(Sender: TObject);
begin
  KeyPreview := RadioPreview.ItemIndex <> 0;
end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
begin
  case RadioPreview.ItemIndex of
    1: //  Enter = Tab
      if Key = #13 then
      begin
        Key := #0;
        Perform (CM_DialogKey, VK_TAB, 0);
      end;
    2: //  Type in Caption
    begin
      if Key = #8 then // backspace: remove last char
        Caption := Copy (Caption, 1,
          Length (Caption) - 1)
      else if Key = #13 then // enter: stop operation
        RadioPreview.ItemIndex := 0
      else // anything else: add character
        Caption := Caption + Key;
      Key := #0;
    end;
    3: // Skip vowels
      if UpCase(Key) in ['A', 'E', 'I', 'O', 'U'] then
        Key := #0;
  end;
end;

end.
