unit QueForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, StdCtrls, Grids, DBGrids, DBClient;

type
  TFormQuery = class(TForm)
    cdsQuery: TClientDataSet;
    DBGrid1: TDBGrid;
    EditParam: TEdit;
    btnParam: TButton;
    DataSource1: TDataSource;
    Label1: TLabel;
    procedure btnParamClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormQuery: TFormQuery;

implementation

uses ThinForm;

{$R *.DFM}

procedure TFormQuery.btnParamClick(Sender: TObject);
begin
  cdsQuery.Close;
  cdsQuery.Params[0].AsString := EditParam.Text;
  cdsQuery.Open;
  Caption := 'Data sent at ' + TimeToStr (
    TDateTime (cdsQuery.GetOptionalParam('Time')));
  Label1.Caption := 'Param ' +
    cdsQuery.GetOptionalParam('Param');
end;

end.
