unit SoapEmployeeImpl;

interface

uses InvokeRegistry, Types, XSBuiltIns, SoapEmployeeIntf;

type
  TSoapEmployee = class(TInvokableClass, ISoapEmployee)
  public
    function GetEmployeeNames: string; stdcall;
    function GetEmployeeData (EmpID: string): string; stdcall;
  end;

implementation

uses
  ServerDataModule, DB, StrUtils, SysUtils;

function MakeXmlStr (nodeName, nodeValue: string; attrList: string = ''): string;
begin
  Result := '<' + nodeName +
    IfThen (attrList <> '', ' ' + attrList, '') + '>' +
    nodeValue +
    '</' + nodeName + '>';
end;

function MakeXmlAttribute (attrName, attrValue: string): string;
begin
  Result := attrName + '="' + attrValue + '"';
end;

function FieldsToXml (rootName: string; data: TDataSet): string;
var
  i: Integer;
begin
  Result := '<' + rootName + '>' + sLineBreak;;
  for i := 0 to data.FieldCount - 1 do
    Result := Result + '  ' + MakeXmlStr (
      LowerCase (data.Fields[i].FieldName),
      data.Fields[i].AsString) + sLineBreak;
  Result := Result + '</' + rootName + '>' + sLineBreak;;
end;

{ TSoapEmployee }

function TSoapEmployee.GetEmployeeData(EmpID: string): string;
var
  dm: TDataModule3;
begin
  dm := TDataModule3.Create (nil);
  try
    dm.dsEmpData.ParamByName('ID').AsString := EmpId;
    dm.dsEmpData.Open;
    Result := FieldsToXml ('employee', dm.dsEmpData);
  finally
    dm.Free;
  end;
end;

function TSoapEmployee.GetEmployeeNames: string;
var
  dm: TDataModule3;
begin
  dm := TDataModule3.Create (nil);
  try
    dm.dsEmplList.Open;
    Result := '<employeeList>' + sLineBreak;
    while not dm.dsEmplList.EOF do
    begin
      Result := Result + '  ' + MakeXmlStr ('employee',
        dm.dsEmplListLAST_NAME.AsString + ' ' +
        dm.dsEmplListFIRST_NAME.AsString,
        MakeXmlAttribute ('id', dm.dsEmplListEMP_NO.AsString)) + sLineBreak;
      dm.dsEmplList.Next;
    end;
    Result := Result + '</employeeList>'
  finally
    dm.Free;
  end;
end;

initialization
  { Invokable classes must be registered }
  InvRegistry.RegisterInvokableClass(TSoapEmployee);

end.
