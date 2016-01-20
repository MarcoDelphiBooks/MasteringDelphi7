program AppServ2;

uses
  Forms,
  SrvForm in 'SrvForm.pas' {Form1},
  AppServTwo_TLB in 'AppServTwo_TLB.pas',
  RemoteDM in 'RemoteDM.pas' {RdmCount: TDataModule} {RdmCount: CoClass};

{$R *.RES}

{$R *.TLB}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
