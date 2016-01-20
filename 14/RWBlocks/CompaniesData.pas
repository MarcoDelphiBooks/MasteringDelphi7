unit CompaniesData;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, IBCustomDataSet, IBDatabase;

type
  TDmCompanies = class(TDataModule)
    DataCompanies: TIBDataSet;
    DataLocations: TIBDataSet;
    DataPeople: TIBDataSet;
    dsCompanies: TDataSource;
    IBTransaction1: TIBTransaction;
    DataLocationsID: TIntegerField;
    DataLocationsID_COMPANY: TIntegerField;
    DataLocationsADDRESS: TIBStringField;
    DataLocationsFAX: TIBStringField;
    DataLocationsPHONE: TIBStringField;
    DataLocationsSTATE: TIBStringField;
    DataLocationsTOWN: TIBStringField;
    DataLocationsZIP: TIBStringField;
    DataPeopleID: TIntegerField;
    DataPeopleID_COMPANY: TIntegerField;
    DataPeopleID_LOCATION: TIntegerField;
    DataPeopleKEY_CONTACT: TIBStringField;
    DataPeopleNAME: TIBStringField;
    DataPeopleEMAIL: TIBStringField;
    DataPeopleFAX: TIBStringField;
    DataPeoplePHONE: TIBStringField;
    DataCompaniesID: TIntegerField;
    DataCompaniesNAME: TIBStringField;
    DataCompaniesTAX_CODE: TIBStringField;
    procedure DataLocationsAfterInsert(DataSet: TDataSet);
    procedure DataPeopleAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  MainData;

{$R *.DFM}

procedure TDmCompanies.DataLocationsAfterInsert(DataSet: TDataSet);
begin
  // initialize the data of the detail record
  // with a reference to the master record
  DataLocationsID_COMPANY.AsInteger :=
    DataCompaniesID.AsInteger;
end;

procedure TDmCompanies.DataPeopleAfterInsert(DataSet: TDataSet);
begin
  // initialize the data of the detail record
  // with a reference to the master record
  DataPeopleID_COMPANY.AsInteger :=
    DataCompaniesID.AsInteger;
  // the suggested location is the active one, if available
  if not DataLocations.IsEmpty then
    DataPeopleID_LOCATION.AsInteger :=
      DataLocationsID.AsInteger;
  // the first person added becomes the key contact
  // (checks if the filtered dataset of people is empty)
  DataPeopleKEY_CONTACT.AsBoolean := DataPeople.IsEmpty;
end;

end.
