unit CompaniesForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, StdCtrls, Mask, Db, Grids, DBGrids,
  CompaniesData, Buttons, ComCtrls;

type
  TFormCompanies = class(TForm)
    dsCompanies: TDataSource;
    DBGridLocations: TDBGrid;
    DBGridPeople: TDBGrid;
    dsLocations: TDataSource;
    dsPeople: TDataSource;
    Panel1: TPanel;
    PageControlSearch: TPageControl;
    TabSheet1: TTabSheet;
    btnSearch: TButton;
    edSearch: TEdit;
    TabSheet2: TTabSheet;
    edTown: TEdit;
    btnTown: TButton;
    DBGridCompanies: TDBGrid;
    btnCancel: TBitBtn;
    btnOK: TBitBtn;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnSearchClick(Sender: TObject);
    procedure edSearchChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnTownClick(Sender: TObject);
    procedure edTownChange(Sender: TObject);
  private
    { Private declarations }
  public
    dm: TDmCompanies;
    class function SelectCompany (var CompanyName: string;
      var CompanyId: Integer): Boolean;
    class function SelectPerson (CompanyId: Integer;
      var PersonId: Integer; var PersonName: string): Boolean;
  end;

var
  FormCompanies: TFormCompanies;

implementation

uses
  MainData;

{$R *.DFM}

procedure TFormCompanies.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
  Msg: string;
begin
  CanClose := True;

  if dsCompanies.State in dsEditModes then
  begin
    CanClose := False;
    Msg := 'Companies';
  end;

  if dsLocations.State in dsEditModes then
  begin
    CanClose := False;
    Msg := 'Locations';
  end;

  if dsPeople.State in dsEditModes then
  begin
    CanClose := False;
    Msg := 'People';
  end;

  if not CanClose then
    ShowMessage (Msg + ': Cancel or accept changes before closing');
end;

procedure TFormCompanies.btnSearchClick(Sender: TObject);
begin
  dm.DataCompanies.Close;
  dm.DataCompanies.SelectSQL.Text :=
    'select c.id, c.name, c.tax_code' +
    '  from companies c ' +
    '  where name_upper starting with ''' +
    UpperCase (edSearch.Text) + '''';
  dm.DataCompanies.Open;
  dm.DataLocations.Open;
  dm.DataPeople.Open;
end;

procedure TFormCompanies.edSearchChange(Sender: TObject);
begin
  btnSearch.Enabled := edSearch.Text <> '';
  if Length (edSearch.Text) >= 3 then
    btnSearch.OnClick (Sender);
end;

procedure TFormCompanies.FormCreate(Sender: TObject);
begin
  dm := TDmCompanies.Create (self);
  dsCompanies.Dataset := dm.DataCompanies;
  dsLocations.Dataset := dm.DataLocations;
  dsPeople.Dataset := dm.DataPeople;
end;

procedure TFormCompanies.btnTownClick(Sender: TObject);
begin
  with dm.DataCompanies do
  begin
    Close;
    SelectSQL.Text :=
      'select c.id, c.name, c.tax_code' +
      '  from companies c ' +
      '  where exists (select loc.id from locations loc ' +
      '  where loc.id_company = c.ID and UPPER(loc.town) = ''' + UpperCase(edTown.Text) + ''' )';
    Open;
    dm.DataLocations.Open;
    dm.DataPeople.Open;
  end;
end;

procedure TFormCompanies.edTownChange(Sender: TObject);
begin
  btnTown.Enabled := edTown.Text <> '';
end;

class function TFormCompanies.SelectCompany (var CompanyName: string;
  var CompanyId: Integer): Boolean;
var
  FormComp: TFormCompanies;
begin
  Result := False;
  FormComp := TFormCompanies.Create (Application);
  FormComp.Caption := 'Select Company';
  try
    // activate dialog buttons
    FormComp.btnCancel.Visible := True;
    FormComp.btnOK.Visible := True;
    // select company
    if CompanyId > 0 then
      FormComp.dm.DataCompanies.SelectSQL.Text :=
        'select c.id, c.name, c.tax_code' +
        '  from companies c ' +
        '  where c.id = ' + IntToStr (CompanyId)
    else
      FormComp.dm.DataCompanies.SelectSQL.Text :=
        'select c.id, c.name, c.tax_code' +
        '  from companies c ' +
        '  where name_upper starting with ''a''';
    FormComp.dm.DataCompanies.Open;
    FormComp.dm.DataLocations.Open;
    FormComp.dm.DataPeople.Open;

    if FormComp.ShowModal = mrOK then
    begin
      Result := True;
      CompanyId := FormComp.dm.DataCompanies.FieldByName ('id').AsInteger;
      CompanyName := FormComp.dm.DataCompanies.FieldByName ('name').AsString;
    end;
  finally
    FormComp.Free;
  end;
end;

class function TFormCompanies.SelectPerson(CompanyId: Integer;
   var PersonId: Integer; var PersonName: string): Boolean;
var
  FormComp: TFormCompanies;
begin
  Result := False;
  FormComp := TFormCompanies.Create (Application);
  FormComp.Caption := 'Select Person';
  try
    with FormComp.dm.DataCompanies do
    begin
      SelectSQL.Text :=
          'select c.id, c.name, c.tax_code' +
          '  from companies c ' +
          '  where c.id = ' + IntToStr (CompanyId);
      Open;
    end;
    FormComp.dm.DataLocations.Open;
    FormComp.dm.DataPeople.Open;

    // activate dialog buttons
    FormComp.btnCancel.Visible := True;
    FormComp.btnOK.Visible := True;
    // read-only, no further searches
    FormComp.dsCompanies.AutoEdit := False;
    FormComp.DBGridCompanies.ReadOnly := True;
    FormComp.PageControlSearch.Visible := False;
    // select person
    if PersonId <> 0 then
      FormComp.dm.DataPeople.Locate ('ID', PersonId, []);
    FormComp.ActiveControl := FormComp.DBGridPeople;
    if FormComp.ShowModal = mrOK then
    begin
      Result := True;
      PersonId := FormComp.dm.DataPeople.FieldByName ('id').AsInteger;
      PersonName := FormComp.dm.DataPeople.FieldByName ('name').AsString
    end;
  finally
    FormComp.Free;
  end;
end;

end.
