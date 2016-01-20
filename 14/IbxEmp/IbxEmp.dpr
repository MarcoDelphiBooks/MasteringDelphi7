program IbxEmp;

uses
  Forms,
  IbEmpF in 'IbEmpF.pas' {FormEmp};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFormEmp, FormEmp);
  Application.Run;
end.
