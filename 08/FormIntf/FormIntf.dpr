program FormIntf;

uses
  Forms,
  MainForm in 'MainForm.pas' {FormMain},
  MemoForm in 'MemoForm.pas' {FormMemo},
  BitmapForm in 'BitmapForm.pas' {FormBitmap},
  FormOperations in 'FormOperations.pas',
  SaveStatusForms in 'SaveStatusForms.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormMemo, FormMemo);
  Application.CreateForm(TFormBitmap, FormBitmap);
  Application.Run;
end.
