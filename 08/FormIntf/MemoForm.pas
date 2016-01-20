unit MemoForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormOperations, StdCtrls, SaveStatusForms;

type
  TFormMemo = class(TSaveStatusForm, IFormOperations)
    Memo1: TMemo;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
  private
    { Private declarations }
  public
    procedure Load;
    procedure Save;
  end;

var
  FormMemo: TFormMemo;

implementation

{$R *.DFM}

{ TForm2 }

procedure TFormMemo.Load;
begin
  if OpenDialog1.Execute then
    Memo1.Lines.LoadFromFile(OpenDialog1.FileName);
end;

procedure TFormMemo.Save;
begin
  if SaveDialog1.Execute then
    Memo1.Lines.SaveToFile(SaveDialog1.FileName);
end;

end.
