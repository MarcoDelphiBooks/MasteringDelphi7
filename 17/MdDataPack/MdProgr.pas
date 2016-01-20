unit MdProgr;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, Forms,
  ComCtrls, DB, DBCtrls;

type
  TMdDbProgress = class(TProgressBar)
  private
    FDataLink: TFieldDataLink;
    function GetDataField: string;
    procedure SetDataField (Value: string);
    function GetDataSource: TDataSource;
    procedure SetDataSource (Value: TDataSource);
    function GetField: TField;
  protected
    // data link event handler
    procedure DataChange (Sender: TObject);
    // useless
    {procedure Notification (AComponent: TComponent;
      Operation: TOperation); override;}
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

constructor TMdDbProgress.Create (AOwner: TComponent);
begin
  inherited Create (AOwner);
  FDataLink := TFieldDataLink.Create;
  FDataLink.Control := self;
  FDataLink.OnDataChange := DataChange;
end;

destructor TMdDbProgress.Destroy;
begin
  FDataLink.Free;
  FDataLink := nil;
  inherited Destroy;
end;

function TMdDbProgress.GetDataField: string;
begin
  Result := FDataLink.FieldName;
end;

procedure TMdDbProgress.SetDataField (Value: string);
begin
  FDataLink.FieldName := Value;
end;

function TMdDbProgress.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

procedure TMdDbProgress.SetDataSource (Value: TDataSource);
begin
  FDataLink.DataSource := Value;
  // useless
  {if Value <> nil then
    Value.FreeNotification (Value);}
end;

function TMdDbProgress.GetField: TField;
begin
  Result := FDataLink.Field;
end;

// data link event handler
procedure TMdDbProgress.DataChange (Sender: TObject);
begin
  if FDataLink.Field is TNumericField then
    Position := FDataLink.Field.AsInteger
  else
    Position := Min;
end;

// useless
{procedure TMdDbProgress.Notification (AComponent: TComponent;
  Operation: Toperation);
begin
  inherited Notification (AComponent, Operation);
  if (Operation = opRemove) and (FDataLink <> nil) and
    (AComponent = FDataLink.DataSource) then
  begin
    FDataLink.DataSource := nil;
    ShowMessage ('Data source set to nil');
  end
  else if (Operation = opRemove) and (FDataLink <> nil) and
    (FDataLink.DataSource = nil) then
  begin
    ShowMessage ('Data source was already nil');
  end;
end;}

procedure Register;
begin
  RegisterComponents('Md', [TMdDbProgress]);
end;

end.
