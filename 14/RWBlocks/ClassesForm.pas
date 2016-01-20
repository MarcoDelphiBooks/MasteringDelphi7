unit ClassesForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Db, ClassesData, StdCtrls, ComCtrls, DBCtrls, ExtCtrls;

type
  TFormClasses = class(TForm)
    dsClassReg: TDataSource;
    dsClasses: TDataSource;
    Tab: TTabControl;
    DBGridClasses: TDBGrid;
    DBGridPeopleReg: TDBGrid;
    dsPeopleReg: TDataSource;
    Splitter1: TSplitter;
    Panel1: TPanel;
    DBGridClassReg: TDBGrid;
    MemoNote: TDBMemo;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    procedure FormCreate(Sender: TObject);
    procedure TabChange(Sender: TObject);
    procedure DBGridClassRegEditButtonClick(Sender: TObject);
    procedure DBGridPeopleRegEditButtonClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    dm: TDmClasses;
    SqlCommands: TStringList;
  public
    { Public declarations }
  end;

var
  FormClasses: TFormClasses;

implementation

uses
  CompaniesForm;

{$R *.DFM}

procedure TFormClasses.FormCreate(Sender: TObject);
begin
  dm := TDmClasses.Create (self);
  // connect the datasets to the datasources
  dsClasses.Dataset := dm.IBClasses;
  dsClassReg.DataSet := dm.IBClassReg;
  dsPeopleReg.DataSet := dm.IBPeopleReg;
  // open the datasets
  dm.IBClasses.Active := True;
  dm.IBClassReg.Active := True;
  dm.IBPeopleReg.Active := True;

  // prepare the SQL for the three tabs
  SqlCommands := TStringList.Create;
  SqlCommands.Add (' where Starts_On > ''NOW''');
  SqlCommands.Add (' where Starts_On <= ''NOW'' and ' +
    ' extract (year from Starts_On) >= extract(year from current_timestamp)');
  SqlCommands.Add (' where Extract (YEAR from Starts_On) < ' +
    ' Extract(YEAR from current_timestamp)');
end;

procedure TFormClasses.TabChange(Sender: TObject);
begin
  dm.IBClasses.Active := False;
  dm.IBClasses.SelectSQL [1] :=
    SqlCommands [Tab.TabIndex];
  dm.IBClasses.Active := True;
end;

procedure TFormClasses.DBGridClassRegEditButtonClick(Sender: TObject);
var
  CompanyName: string;
  CompanyId: Integer;
begin
  CompanyId := dm.IBClassReg.FieldByName ('id_Company').AsInteger;
  if TFormCompanies.SelectCompany (CompanyName, CompanyId) then
  begin
    dm.IBClassReg.Edit;
    dm.IBClassReg.FieldByName (
      'Name').AsString := CompanyName;
    dm.IBClassReg.FieldByName (
      'id_Company').AsInteger := CompanyId;
  end;
end;

procedure TFormClasses.DBGridPeopleRegEditButtonClick(Sender: TObject);
var
  PersonName: string;
  CompanyId, PersonId: Integer;
begin
  PersonId := 0;
  CompanyId := dm.IBClassReg.FieldByName ('id_Company').AsInteger;
  if not dm.IBPeopleReg.FieldByName ('id_Person').IsNull then
    PersonId := dm.IBPeopleReg.FieldByName ('id_Person').AsInteger;
  if TFormCompanies.SelectPerson (CompanyId, PersonId, PersonName) then
  begin
    if not (dm.IBPeopleReg.State in dsEditModes) then
      dm.IBPeopleReg.Edit;
    dm.IBPeopleReg.FieldByName (
      'Name').AsString := PersonName;
    dm.IBPeopleReg.FieldByName (
      'ID_Person').AsInteger := PersonId;
  end;
end;

procedure TFormClasses.FormDestroy(Sender: TObject);
begin
  SqlCommands.Free;
end;

end.
