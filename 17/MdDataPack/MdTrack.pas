unit MdTrack;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, DB, DBCtrls;

type
  TMdDbTrack = class(TTrackBar)
  private
    FDataLink: TFieldDataLink;
    function GetDataField: string;
    procedure SetDataField (Value: string);
    function GetDataSource: TDataSource;
    procedure SetDataSource (Value: TDataSource);
    function GetField: TField;
    procedure CNHScroll(var Message: TWMHScroll); message CN_HSCROLL;
    procedure CNVScroll(var Message: TWMVScroll); message CN_VSCROLL;
    procedure CMExit(var Message: TCMExit); message CM_EXIT;
  protected
    // data link event handlers
    procedure DataChange (Sender: TObject);
    procedure UpdateData (Sender: TObject);
    procedure ActiveChange (Sender: TObject);
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

constructor TMdDbTrack.Create (AOwner: TComponent);
begin
  inherited Create (AOwner);
  FDataLink := TFieldDataLink.Create;
  FDataLink.Control := self;
  FDataLink.OnDataChange := DataChange;
  FDataLink.OnUpdateData := UpdateData;
  FDataLink.OnActiveChange := ActiveChange;
  Enabled := False;
end;

destructor TMdDbTrack.Destroy;
begin
  FDataLink.Free;
  FDataLink := nil;
  inherited Destroy;
end;

function TMdDbTrack.GetDataField: string;
begin
  Result := FDataLink.FieldName;
end;

procedure TMdDbTrack.SetDataField (Value: string);
begin
  try
    FDataLink.FieldName := Value;
  finally
    Enabled := FDataLink.Active and
      (FDataLink.Field <> nil) and
      not FDataLink.Field.ReadOnly;
  end;
end;

function TMdDbTrack.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

procedure TMdDbTrack.SetDataSource (Value: TDataSource);
begin
  FDataLink.DataSource := Value;
  Enabled := FDataLink.Active and
    (FDataLink.Field <> nil) and
    not FDataLink.Field.ReadOnly;
end;

function TMdDbTrack.GetField: TField;
begin
  Result := FDataLink.Field;
end;

// data link event handler
procedure TMdDbTrack.DataChange (Sender: TObject);
begin
  if (FDataLink.Field <> nil) and
      (FDataLink.Field is TNumericField) then
    Position := FDataLink.Field.AsInteger
  else
    Position := Min;
end;

procedure TMdDbTrack.ActiveChange (Sender: TObject);
begin
  Enabled := FDataLink.Active and
    (FDataLink.Field <> nil) and
    not FDataLink.Field.ReadOnly;
end;

// update
procedure TMdDbTrack.CNHScroll(var Message: TWMHScroll);
begin
  // edit mode
  FDataLink.Edit;
  // update data
  inherited;
  // let the system know
  FDataLink.Modified;
end;

procedure TMdDbTrack.CNVScroll(var Message: TWMVScroll);
begin
  // edit mode
  FDataLink.Edit;
  // update data
  inherited;
  // let the system know
  FDataLink.Modified;
end;

procedure TMdDbTrack.CMExit(var Message: TCMExit);
begin
  try
    FDataLink.UpdateRecord;
  except
    SetFocus;
    raise;
  end;
  inherited;
end;

procedure TMdDbTrack.UpdateData (Sender: TObject);
begin
  if FDataLink.Field is TNumericField then
    FDataLink.Field.AsInteger := Position;
end;

procedure Register;
begin
  RegisterComponents('Md', [TMdDbTrack]);
end;

end.
