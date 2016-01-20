unit MdDsList;

interface

uses
  DB, Classes, SysUtils, Windows, Forms, Contnrs, MdDsCustom;

type
  TMdListDataSet = class (TMdCustomDataSet)
  protected
    // the list holding the data
    FList: TObjectList;
    // dataset virtual methods
    procedure InternalPreOpen; override;
    procedure InternalClose; override;
    // custom dataset virtual methods
    function InternalRecordCount: Integer; override;
    procedure InternalLoadCurrentRecord (Buffer: TRecordBuffer); override;
  end;

implementation

procedure TMdListDataSet.InternalPreOpen;
begin
  FList := TObjectList.Create (True); // owns objects
  FRecordSize := 4; // an integer, the list item id
end;

procedure TMdListDataSet.InternalClose;
begin
  FList.Free;
  inherited;
end;

procedure TMdListDataSet.InternalLoadCurrentRecord (Buffer: TRecordBuffer);
begin
  PInteger (Buffer)^ := fCurrentRecord;
  with PMdRecInfo(Buffer + FRecordSize)^ do
  begin
    BookmarkFlag := bfCurrent;
    Bookmark := fCurrentRecord;
  end;
end;

function TMdListDataSet.InternalRecordCount: Integer;
begin
  Result := fList.Count;
end;

end.
