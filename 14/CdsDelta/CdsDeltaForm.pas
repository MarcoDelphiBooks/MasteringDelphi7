unit CdsDeltaForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBClient, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, MConnect,
  MidasCon;

type
  TFormCds = class(TForm)
    DataSource1: TDataSource;
    Panel1: TPanel;
    ButtonUpdate: TButton;
    ButtonDelta: TButton;
    ButtonUndo: TButton;
    PageControl1: TPageControl;
    TabSheetData: TTabSheet;
    TabSheetDelta: TTabSheet;
    DBGrid2: TDBGrid;
    DataSource2: TDataSource;
    DBGrid1: TDBGrid;
    procedure ButtonUpdateClick(Sender: TObject);
    procedure ButtonDeltaClick(Sender: TObject);
    procedure ButtonUndoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCds: TFormCds;

implementation

{$R *.DFM}

uses
  TypInfo, Reconc, CdsDeltaDm;

procedure TFormCds.ButtonUpdateClick(Sender: TObject);
begin
  DmCds.cdsEmployee.ApplyUpdates (-1);
  // activate data and hide delta
  PageControl1.ActivePage := TabSheetData;
  TabSheetDelta.TabVisible := False;
end;

procedure TFormCds.ButtonDeltaClick(Sender: TObject);
begin
  if DmCds.cdsEmployee.ChangeCount > 0 then
  begin
    DmCds.cdsDelta.Data := DmCds.cdsEmployee.Delta;
    DmCds.cdsDelta.Open;
    // activate delta
    TabSheetDelta.TabVisible := True;
    PageControl1.ActivePage := TabSheetDelta;
  end
  else
  begin
    TabSheetDelta.TabVisible := False;
    ShowMessage ('No udpates in log');
  end;
end;

procedure TFormCds.ButtonUndoClick(Sender: TObject);
begin
  DmCds.cdsEmployee.UndoLastChange (True);
end;

procedure TFormCds.FormCreate(Sender: TObject);
begin
  DmCds.cdsEmployee.Open;
  TabSheetDelta.TabVisible := False;
end;

procedure TFormCds.PageControl1Change(Sender: TObject);
begin
  if PageControl1.ActivePage = TabSheetDelta then
    if DmCds.cdsEmployee.ChangeCount > 0 then
      DmCds.cdsDelta.Data := DmCds.cdsEmployee.Delta
    else
    begin
      TabSheetDelta.TabVisible := False;
      PageControl1.ActivePage := TabSheetData;
    end;
end;

end.
