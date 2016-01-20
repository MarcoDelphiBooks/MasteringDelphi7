unit MdCollect;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

type
  ECanError = class (Exception);

  TMyItem = class (TCollectionItem)
  private
    FCode: Integer;
    FText: string;
    procedure SetCode(const Value: Integer);
    procedure SetText(const Value: string);
  published
    property Text: string read FText write SetText;
    property Code: Integer read FCode write SetCode;
  end;

  TMyCollection = class (TCollection)
  private
    fComp: TComponent;
    fCollString: string;
  public
    constructor Create (CollOwner: TComponent);
    function GetOwner: TPersistent; override;
    procedure Update(Item: TCollectionItem); override;
  end;

  TMdCollection = class(TComponent)
  private
    fColl: TMyCollection;
    procedure SetMoreData(const Value: TMyCollection);
    function GetCollString: string;
  protected
  public
    constructor Create (aOwner: TComponent); override;
    destructor Destroy; override;
  published
    property MoreData: TMyCollection read FColl write SetMoreData;
    property CollString: string read GetCollString;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents ('Md', [TMdCollection]);
end;

{ TMdCollection }

constructor TMdCollection.Create(aOwner: TComponent);
begin
  inherited;
  fColl := TMyCollection.Create (self);
end;

destructor TMdCollection.Destroy;
begin
  inherited;
  fColl.Free;
end;

function TMdCollection.GetCollString: string;
begin
  Result := fColl.fCollString;
end;

procedure TMdCollection.SetMoreData(const Value: TMyCollection);
begin
  FColl.Assign (Value);
end;

{ TMyItem }

procedure TMyItem.SetCode(const Value: Integer);
begin
  FCode := Value;
  Changed (False);
end;

procedure TMyItem.SetText(const Value: string);
begin
  FText := Value;
  Changed (False);
end;

{ TMyCollection }

constructor TMyCollection.Create (CollOwner: TComponent);
begin
  inherited Create (TMyItem);
  fComp := CollOwner;
end;

function TMyCollection.GetOwner: TPersistent;
begin
  Result := fComp;
end;

procedure TMyCollection.Update(Item: TCollectionItem);
var
  str: string;
  i: integer;
begin
  inherited;
  // udpate all in any case
  str := '';
  for i := 0 to Count - 1 do
  begin
    str := str + (Items [i] as TMyItem).Text;
    if i < Count - 1 then
      str := str + '-';
  end;
  fCollString := str;
end;

end.
