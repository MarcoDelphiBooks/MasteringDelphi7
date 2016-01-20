program UddiInquiry;

uses
  Forms,
  InquireForm in 'InquireForm.pas' {Form1},
  inquire_v1 in 'inquire_v1.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
