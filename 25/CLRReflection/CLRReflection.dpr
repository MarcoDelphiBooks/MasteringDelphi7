program CLRReflection;

uses
  System.Windows.Forms,
  ReflectionUnit;
  
var
  reflectForm : ReflectionForm;

begin
  reflectForm := ReflectionForm.Create;
  System.Windows.Forms.Application.Run(reflectForm);
end.
