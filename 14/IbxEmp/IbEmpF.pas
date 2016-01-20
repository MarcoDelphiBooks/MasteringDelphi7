unit IbEmpF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBTables, Mask, ExtCtrls, IBDatabase,
  IBCustomDataSet, IBQuery, IBSQL;

type
  TFormEmp = class(TForm)
    ScrollBox: TScrollBox;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    DataSource1: TDataSource;
    Panel2: TPanel;
    IBQuery1: TIBQuery;
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    IBQuery1EMP_NO: TIntegerField;
    IBQuery1FIRST_NAME: TIBStringField;
    IBQuery1LAST_NAME: TIBStringField;
    IBQuery1PHONE_EXT: TIBStringField;
    IBQuery1HIRE_DATE: TDateTimeField;
    IBQuery1DEPT_NO: TIBStringField;
    IBQuery1JOB_CODE: TIBStringField;
    IBQuery1JOB_GRADE: TIntegerField;
    IBQuery1JOB_COUNTRY: TIBStringField;
    IBQuery1SALARY: TFloatField;
    IBQuery1FULL_NAME: TIBStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  FormEmp: TFormEmp;

implementation

{$R *.DFM}

procedure TFormEmp.FormCreate(Sender: TObject);
begin
  IBQuery1.Open;
end;

end.
