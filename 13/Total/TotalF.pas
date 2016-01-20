unit TotalF;

interface

uses
  SysUtils, Windows, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, Buttons, DBTables, Mask, ExtCtrls,
  Dialogs, Spin, DBActns, ActnList, ImgList, ComCtrls, ToolWin,
  DBClient;

type
  TSearchForm = class(TForm)
    DataSource1: TDataSource;
    ScrollBox: TScrollBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    EditEmpNo: TDBEdit;
    EditLastName: TDBEdit;
    EditFirstName: TDBEdit;
    EditPhoneExt: TDBEdit;
    EditHireDate: TDBEdit;
    EditSalary: TDBEdit;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    EditName: TEdit;
    ToolButton7: TToolButton;
    ActionList: TActionList;
    DataSetFirst1: TDataSetFirst;
    DataSetLast1: TDataSetLast;
    DataSetNext1: TDataSetNext;
    DataSetPrior1: TDataSetPrior;
    ActionGoto: TAction;
    ToolButton8: TToolButton;
    SpinEdit1: TSpinEdit;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ActionTotal: TAction;
    ActionIncrease: TAction;
    cds: TClientDataSet;
    cdsEmpNo: TIntegerField;
    cdsLastName: TStringField;
    cdsFirstName: TStringField;
    cdsPhoneExt: TStringField;
    cdsHireDate: TDateTimeField;
    cdsSalary: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure ActionIncreaseExecute(Sender: TObject);
    procedure ActionTotalExecute(Sender: TObject);
    procedure ActionGotoExecute(Sender: TObject);
    procedure ActionGotoUpdate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  SearchForm: TSearchForm;

implementation

{$R *.dfm}

procedure TSearchForm.FormCreate(Sender: TObject);
begin
  cds.Open;
  cds.IndexFieldNames := 'LastName';
  cds.First;
end;

procedure TSearchForm.ActionIncreaseExecute(Sender: TObject);
var
  Bookmark: TBookmarkStr;
  Total: Double;
begin
  // store the current position in a bookmark
  Bookmark := cds.Bookmark;
  cds.DisableControls;
  Total := 0;
  try
    cds.First;
    while not cds.EOF do
    begin
      // start edit mode
      cds.Edit;
      cdsSalary.Value := Round (cdsSalary.Value *
        SpinEdit1.Value) / 100;
      Total := Total + cdsSalary.Value;
      cds.Next;
    end;
  finally
    // go back to the bookmark
    cds.Bookmark := Bookmark;
    cds.EnableControls;
  end;
  MessageDlg ('Sum of new salaries is ' +
    Format ('%m', [Total]), mtInformation, [mbOk], 0);
end;

procedure TSearchForm.ActionTotalExecute(Sender: TObject);
var
  Bookmark: TBookmarkStr;
  Total: Double;
begin
  // store the current position in a bookmark
  Bookmark := cds.Bookmark;
  cds.DisableControls;
  Total := 0;
  try
    cds.First;
    while not cds.EOF do
    begin
      Total := Total + cdsSalary.Value;
      cds.Next;
    end;
  finally
    // go back to the bookmark
    cds.Bookmark := Bookmark;
    cds.EnableControls;
  end;
  MessageDlg ('Sum of new salaries is ' +
    Format ('%m', [Total]), mtInformation, [mbOk], 0);
end;

procedure TSearchForm.ActionGotoExecute(Sender: TObject);
begin
  if not cds.Locate ('LastName', EditName.Text, []) then
    MessageDlg ('Name not found', mtError, [mbOk], 0);
end;

procedure TSearchForm.ActionGotoUpdate(Sender: TObject);
begin
  ActionGoto.Enabled := EditName.Text <> '';
end;

end.
