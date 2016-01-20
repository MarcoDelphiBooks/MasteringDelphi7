unit IwClientGridData;

interface

uses
  {$IFDEF Linux}QForms, {$ELSE}Forms, {$ENDIF}
  SysUtils, Classes, DB, DBClient, SimpleDS;

type
  TDataModule1 = class(TDataModule)
    SimpleDataSet1: TSimpleDataSet;
    SimpleDataSet1EMP_NO: TSmallintField;
    SimpleDataSet1FIRST_NAME: TStringField;
    SimpleDataSet1LAST_NAME: TStringField;
    SimpleDataSet1PHONE_EXT: TStringField;
    SimpleDataSet1DEPT_NO: TStringField;
    SimpleDataSet1JOB_CODE: TStringField;
    SimpleDataSet1JOB_GRADE: TSmallintField;
    SimpleDataSet1JOB_COUNTRY: TStringField;
  private
  public
  end;

// Procs
  function DataModule1: TDataModule1;

implementation
{$R *.dfm}

uses
  IWInit,
  IwDbServerController;

// Since we are threaded we cannot use global variables to store form / datamodule references
// so we store them in WebApplication.Data and we could reference that each time, but by creating
// a function like this our other code looks "normal" almost as if its referencing a global.
// This function is not necessary but it makes the code in the main form which references this
// datamodule a lot neater.
// Without this function ever time we would reference this datamodule we would use:
//   TDataModule1(WebApplication.Data).Datamodule.<method / component>
// By creating this procedure it becomes:
//   TDataModule1.<method / component>
// Which is just like normal Delphi code.
function DataModule1: TDataModule1;
begin
  Result := TUserSession(RWebApplication.Data).Datamodule1;
end;

end.
 