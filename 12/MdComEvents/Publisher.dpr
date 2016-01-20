program Publisher;

uses
  Forms,
  PublisherForm in 'PublisherForm.pas' {Form1},
  MdComEvents_TLB in 'MdComEvents_TLB.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
