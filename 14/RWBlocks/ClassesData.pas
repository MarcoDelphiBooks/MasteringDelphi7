unit ClassesData;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IBCustomDataSet, IBDatabase, Db, IBQuery;

type
  TDmClasses = class(TDataModule)
    IBTransaction1: TIBTransaction;
    IBClassReg: TIBDataSet;
    dsClasses: TDataSource;
    IBClasses: TIBDataSet;
    IBPeopleReg: TIBDataSet;
    dsReg: TDataSource;
    procedure IBClassRegAfterInsert(DataSet: TDataSet);
    procedure IBPeopleRegAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmClasses: TDmClasses;

implementation

uses MainData;

{$R *.DFM}

procedure TDmClasses.IBClassRegAfterInsert(DataSet: TDataSet);
begin
  IBClassReg.FieldByName ('ID_CLASS').AsString :=
    IBClasses.FieldByName ('ID').AsString;
end;

procedure TDmClasses.IBPeopleRegAfterInsert(DataSet: TDataSet);
begin
  IBPeopleReg.FieldByName ('ID_CLASSES_REG').AsString :=
    IBClassReg.FieldByName ('ID').AsString;
end;

end.
