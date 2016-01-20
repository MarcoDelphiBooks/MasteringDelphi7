unit MdRepPr;   

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, Forms,
  ComCtrls, DB, DBCtrls;

type
  TMdDbRepProgress = class(TProgressBar)
  private
    FDataLink: TFieldDataLink;
    FPaintControl: TPaintControl;
    function GetDataField: string;
    procedure SetDataField (Value: string);
    function GetDataSource: TDataSource;
    procedure SetDataSource (Value: TDataSource);
    function GetField: TField;
    // DbCtrlGrid support
    procedure CmGetDataLink (var Msg: TMessage);
      message cm_GetDataLink;
    procedure WmPaint (var Msg: TWmPaint);
      message wm_Paint;
    function GetPos: Integer;
  protected
    procedure WndProc(var Message: TMessage); override;
    // data link event handler
    procedure DataChange (Sender: TObject);
  public
    constructor Create (AOwner: TComponent); override;
    destructor Destroy; override;
    property Field: TField read GetField;
  published
    property DataField: string
      read GetDataField write SetDataField;
    property DataSource: TDataSource
      read GetDataSource write SetDataSource;
  end;

procedure Register;

implementation

uses
  Dialogs, CommCtrl, DbCGrids;

constructor TMdDbRepProgress.Create (AOwner: TComponent);
begin
  inherited Create (AOwner);
  FDataLink := TFieldDataLink.Create;
  FDataLink.Control := self;
  FDataLink.OnDataChange := DataChange;
  // enable use in DBCtrlGrid
  ControlStyle := ControlStyle + [csReplicatable];
  FPaintControl := TPaintControl.Create(
    self, PROGRESS_CLASS);
end;

destructor TMdDbRepProgress.Destroy;
begin
  FDataLink.Free;
  FDataLink := nil;
  FPaintControl.Free;
  inherited Destroy;
end;

function TMdDbRepProgress.GetDataField: string;
begin
  Result := FDataLink.FieldName;
end;

procedure TMdDbRepProgress.SetDataField (Value: string);
begin
  FDataLink.FieldName := Value;
end;

function TMdDbRepProgress.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

procedure TMdDbRepProgress.SetDataSource (Value: TDataSource);
begin
  FDataLink.DataSource := Value;
end;

function TMdDbRepProgress.GetField: TField;
begin
  Result := FDataLink.Field;
end;

// data link event handler
procedure TMdDbRepProgress.DataChange (Sender: TObject);
begin
  SendMessage(Handle, Wm_SetRedraw, 0, 0);
  Position := GetPos;
  SendMessage(Handle, Wm_SetRedraw, 1, 0);
  if HandleAllocated then
    RedrawWindow (Handle, nil, 0,
      RDW_INVALIDATE or RDW_ERASE or RDW_FRAME);
end;

function TMdDbRepProgress.GetPos;
begin
  if FDataLink.Field is TNumericField then
    Result := FDataLink.Field.AsInteger
  else
    Result := Min;
end;

// DBCtrlGrid support methods

procedure TMdDbRepProgress.CmGetDataLink (var Msg: TMessage);
begin
  Msg.Result := Integer (fDataLink);
end;

procedure TMdDbRepProgress.WmPaint (var Msg: TWmPaint);
begin
  if not (csPaintCopy in ControlState) then
    inherited
  else
  begin
    SendMessage(FPaintControl.Handle, Wm_SetRedraw, 0, 0);
    SendMessage(FPaintControl.Handle, PBM_SETRANGE32, Min, Max);
    SendMessage(FPaintControl.Handle, PBM_SETPOS, GetPos, 0);
    SendMessage(FPaintControl.Handle, PBM_SETSTEP, Step, 0);
    SendMessage(FPaintControl.Handle, Wm_SetRedraw, 1, 0);	  
    SendMessage(FPaintControl.Handle,
      wm_Paint, Msg.DC, 0);
  end;
end;

procedure TMdDbRepProgress.WndProc(var Message: TMessage);
begin
  with Message do
    if (Msg = WM_CREATE) or
        (Msg = WM_WINDOWPOSCHANGED) then
      FPaintControl.DestroyHandle;
  inherited;
end;

procedure Register;
begin
  RegisterComponents('Md', [TMdDbRepProgress]);
end;

end.
