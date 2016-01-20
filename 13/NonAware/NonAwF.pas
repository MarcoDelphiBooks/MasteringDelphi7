unit NonAwF;

interface

uses
  Windows, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, DB, StdCtrls, Grids, DBGrids, ComCtrls, DBActns, ActnList,
  Mask, DBCtrls, DBClient, ExtCtrls;

type
  TForm1 = class(TForm)
    EditName: TEdit;
    EditCapital: TEdit;
    EditPopulation: TEdit;
    EditArea: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ComboContinent: TComboBox;
    Button1: TButton;
    Button2: TButton;
    StatusBar1: TStatusBar;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    ActionList1: TActionList;
    ActionNext: TAction;
    ActionPrior: TAction;
    ActionInsert: TAction;
    ActionPost: TAction;
    ActionCancel: TAction;
    cds: TClientDataSet;
    cdsName: TStringField;
    cdsCapital: TStringField;
    cdsContinent: TStringField;
    cdsArea: TFloatField;
    cdsPopulation: TFloatField;
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure cdsBeforePost(DataSet: TDataSet);
    procedure cdsAfterInsert(DataSet: TDataSet);
    procedure EditKeyPress(Sender: TObject; var Key: Char);
    procedure ComboContinentDropDown(Sender: TObject);
    procedure DataSource1StateChange(Sender: TObject);
    procedure EditNameExit(Sender: TObject);
    procedure EditCapitalExit(Sender: TObject);
    procedure ComboContinentExit(Sender: TObject);
    procedure EditPopulationExit(Sender: TObject);
    procedure EditAreaExit(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
    procedure ActionPriorExecute(Sender: TObject);
    procedure ActionInsertExecute(Sender: TObject);
    procedure ActionPostExecute(Sender: TObject);
    procedure ActionNextExecute(Sender: TObject);
    procedure ActionNextUpdate(Sender: TObject);
    procedure ActionPriorUpdate(Sender: TObject);
    procedure ActionInsertUpdate(Sender: TObject);
    procedure ActionPostUpdate(Sender: TObject);
    procedure ActionCancelUpdate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cdsAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  EditName.Text := cdsName.AsString;
  EditCapital.Text := cdsCapital.AsString;
  ComboContinent.Text := cdsContinent.AsString;
  EditArea.Text := cdsArea.AsString;
  EditPopulation.Text := cdsPopulation.AsString;
end;

procedure TForm1.cdsBeforePost(DataSet: TDataSet);
begin
  if cdsArea.Value < 100 then
    raise Exception.Create ('Area too small');
end;

procedure TForm1.cdsAfterInsert(DataSet: TDataSet);
begin
  cdsContinent.Value := 'Asia';
end;

procedure TForm1.EditKeyPress(Sender: TObject; var Key: Char);
begin
  if not (cds.State in [dsEdit, dsInsert]) then
    cds.Edit;
end;

procedure TForm1.ComboContinentDropDown(Sender: TObject);
begin
  if not (cds.State in [dsEdit, dsInsert]) then
    cds.Edit;
end;

procedure TForm1.DataSource1StateChange(Sender: TObject);
var
  strStatus: string;
begin
  case cds.State of
    dsBrowse: strStatus := 'Browse';
    dsEdit: strStatus := 'Edit';
    dsInsert: strStatus := 'Insert';
  else
    strStatus := 'Other state';
  end;
  StatusBar1.SimpleText := strStatus;
end;

procedure TForm1.EditNameExit(Sender: TObject);
begin
  if cds.State in [dsEdit, dsInsert] then
    if EditName.Text <> '' then
      cdsName.AsString := EditName.Text
    else
    begin
      EditName.SetFocus;
      raise Exception.Create ('Undefined Country');
    end;
end;

procedure TForm1.EditCapitalExit(Sender: TObject);
begin
  if cds.State in [dsEdit, dsInsert] then
    cdsCapital.AsString := EditCapital.Text;
end;

procedure TForm1.ComboContinentExit(Sender: TObject);
begin
  if cds.State in [dsEdit, dsInsert] then
    cdsContinent.AsString := ComboContinent.Text;
end;

procedure TForm1.EditPopulationExit(Sender: TObject);
begin
  if cds.State in [dsEdit, dsInsert] then
    cdsPopulation.AsString := EditPopulation.Text;
end;

procedure TForm1.EditAreaExit(Sender: TObject);
begin
  if cds.State in [dsEdit, dsInsert] then
    cdsArea.AsString := EditArea.Text;
end;

procedure TForm1.ActionCancelExecute(Sender: TObject);
begin
  cds.Cancel;
end;

procedure TForm1.ActionPriorExecute(Sender: TObject);
begin
  cds.Prior
end;

procedure TForm1.ActionInsertExecute(Sender: TObject);
begin
  cds.Insert;
end;

procedure TForm1.ActionPostExecute(Sender: TObject);
begin
  cds.Post;
end;

procedure TForm1.ActionNextExecute(Sender: TObject);
begin
  cds.Next;
end;

procedure TForm1.ActionNextUpdate(Sender: TObject);
begin
  ActionNext.Enabled := not cds.EOF; 
end;

procedure TForm1.ActionPriorUpdate(Sender: TObject);
begin
  ActionPrior.Enabled := not cds.BOF;
end;

procedure TForm1.ActionInsertUpdate(Sender: TObject);
begin
  ActionInsert.Enabled := cds.State = dsBrowse;
end;

procedure TForm1.ActionPostUpdate(Sender: TObject);
begin
  ActionPost.Enabled := cds.State in [dsEdit, dsInsert];
end;

procedure TForm1.ActionCancelUpdate(Sender: TObject);
begin
  ActionCancel.Enabled := cds.State in [dsEdit, dsInsert];
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  cds.Open;
end;

procedure TForm1.cdsAfterScroll(DataSet: TDataSet);
begin
  EditName.Text := cdsName.AsString;
  EditCapital.Text := cdsCapital.AsString;
  ComboContinent.Text := cdsContinent.AsString;
  EditArea.Text := cdsArea.AsString;
  EditPopulation.Text := cdsPopulation.AsString;
end;

end.
