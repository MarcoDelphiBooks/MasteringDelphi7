unit MdAggregate;

interface

type
  TMdAggregatedObject = class
  private
    FController: Pointer;
    function GetController: IInterface;
  protected
    { IInterface }
    function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
  public
    constructor Create(Controller: IInterface);
    property Controller: IInterface read GetController;
  end;

implementation

function TMdAggregatedObject._AddRef: Integer;
begin
  Result := IInterface(FController)._AddRef;
end;

function TMdAggregatedObject._Release: Integer;
begin
  Result := IInterface(FController)._Release;
end;

constructor TMdAggregatedObject.Create(Controller: IInterface);
begin
  FController := Pointer(Controller);
end;

function TMdAggregatedObject.GetController: IInterface;
begin
  Result := IInterface(FController);
end;

function TMdAggregatedObject.QueryInterface(const IID: TGUID;
  out Obj): HResult;
begin
  Result := IUnknown(FController).QueryInterface(IID, Obj);
end;

end.
 