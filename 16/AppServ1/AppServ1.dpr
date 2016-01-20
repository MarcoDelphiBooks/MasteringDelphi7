program AppServ1;

uses
  Forms,
  AppServForm in 'AppServForm.pas' {Form1},
  AppServ1_TLB in 'AppServ1_TLB.pas',
  AppServRdm in 'AppServRdm.pas' {AppServerOne: TRemoteDataModule} {AppServerOne: CoClass};

{$R *.TLB}

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
