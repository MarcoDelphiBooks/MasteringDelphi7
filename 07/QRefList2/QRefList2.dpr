program QRefList2;

uses
  QForms,
  RefForm in 'RefForm.pas' {Form1},
  NewDial in 'NewDial.pas' {FormItem};

{$R *.res}

begin
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFormItem, FormItem);
  Application.Run;
end.
