unit FldTextF;

interface

uses
  Windows, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, Mask, DBCtrls, ExtCtrls, Grids, DBGrids, ComCtrls,
  DBClient;

type
  TDbaForm = class(TForm)
    DataSource1: TDataSource;
    Panel1: TPanel;
    Button2: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    DBCheckBox1: TDBCheckBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBComboBox1: TDBComboBox;
    DBText1: TDBText;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBListBox1: TDBListBox;
    cds: TClientDataSet;
    cdsLastName: TStringField;
    cdsFirstName: TStringField;
    cdsDepartment: TSmallintField;
    cdsBranch: TStringField;
    cdsSenior: TBooleanField;
    cdsHireDate: TDateField;
    procedure FormCreate(Sender: TObject);
    procedure cdsDepartmentGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure cdsDepartmentSetText(Sender: TField; const Text: String);
  private
    { Private declarations }
  end;

var
  DbaForm: TDbaForm;

implementation

{$R *.dfm}

procedure TDbaForm.FormCreate(Sender: TObject);
begin
  if not FileExists (cds.FileName) then
    cds.CreateDataset;
  cds.Open;
end;

procedure TDbaForm.cdsDepartmentGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  case Sender.AsInteger of
    1: Text := 'Sales';
    2: Text := 'Accounting';
    3: Text := 'Production';
    4: Text := 'Management';
  else
    Text := '[Error]';
  end;
end;

procedure TDbaForm.cdsDepartmentSetText(Sender: TField;
  const Text: String);
begin
  if Text = 'Sales' then
    Sender.Value := 1
  else if Text = 'Accounting' then
    Sender.Value := 2
  else if Text = 'Production' then
    Sender.Value := 3
  else if Text = 'Management' then
    Sender.Value := 4
  else
    raise Exception.Create ('Error in Department field conversion');
end;

end.
 
