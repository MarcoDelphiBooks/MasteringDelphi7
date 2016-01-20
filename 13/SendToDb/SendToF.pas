unit SendToF;

interface

uses
  Windows, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, DB, StdCtrls, Grids, DBGrids, ComCtrls, DBClient;

type
  TForm1 = class(TForm)
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
    ComboName: TComboBox;
    cds: TClientDataSet;
    cdsName: TStringField;
    cdsCapital: TStringField;
    cdsContinent: TStringField;
    cdsArea: TFloatField;
    cdsPopulation: TFloatField;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboNameKeyPress(Sender: TObject; var Key: Char);
    procedure ComboNameClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure GetData;
    procedure SendData;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.GetData;
begin
  cds.Locate ('Name', ComboName.Text, [loCaseInsensitive]);
  ComboName.Text := cdsName.AsString;
  EditCapital.Text := cdsCapital.AsString;
  ComboContinent.Text := cdsContinent.AsString;
  EditArea.Text := cdsArea.AsString;
  EditPopulation.Text := cdsPopulation.AsString;
end;

procedure TForm1.SendData;
begin
  // raise an exception if there is no name
  if ComboName.Text = '' then
    raise Exception.Create ('Insert the name');

  // check if the record is already in the table
  if cds.Locate ('Name', ComboName.Text, [loCaseInsensitive]) then
  begin
    // modify found record
    cds.Edit;
    cdsCapital.AsString := EditCapital.Text;
    cdsContinent.AsString := ComboContinent.Text;
    cdsArea.AsString := EditArea.Text;
    cdsPopulation.AsString := EditPopulation.Text;
    cds.Post;
  end
  else
  begin
    // insert new record
    cds.InsertRecord ([ComboName.Text,
      EditCapital.Text, ComboContinent.Text,
      EditArea.Text, EditPopulation.Text]);
    // add to list
    ComboName.Items.Add (ComboName.Text)
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  GetData;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  SendData;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  // fill the list of names
  cds.Open;
  while not cds.Eof do
  begin
    ComboName.Items.Add (cdsName.AsString);
    cds.Next;
  end;
end;

procedure TForm1.ComboNameKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    GetData;
end;

procedure TForm1.ComboNameClick(Sender: TObject);
begin
  GetData;
end;

end.
