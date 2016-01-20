program ObjDataSetDemo;

uses
  Forms,
  objdsDemoFormbase in 'objdsDemoFormbase.pas' {Form2},
  ObjdsSampleClass in 'ObjdsSampleClass.pas',
  MdDsObjects in '..\MdDataPack\MdDsObjects.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
