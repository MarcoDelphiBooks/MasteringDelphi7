program Reflist2;

uses
  Forms,
  RefForm in 'RefForm.pas' {Form1},
  NewDial in 'NewDial.pas' {FormItem};

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFormItem, FormItem);
  Application.Run;
end.
