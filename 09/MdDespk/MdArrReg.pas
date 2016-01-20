unit MdArrReg;

interface

uses
  DesignIntf, Classes;

procedure Register;

implementation

uses
  MdArrow;

procedure Register;
begin
  RegisterPropertyInCategory (
    'Input', TMdArrow, 'OnArrowDblClick');
  RegisterPropertyInCategory (
    'Arrow', TMdArrow, 'Direction');
  RegisterPropertyInCategory (
    'Arrow', TMdArrow, 'ArrowHeight');
  RegisterPropertyInCategory (
    'Arrow', TMdArrow, 'Filled');
  RegisterPropertyInCategory (
    'Visual', TMdArrow, 'Filled');
end;

end.
