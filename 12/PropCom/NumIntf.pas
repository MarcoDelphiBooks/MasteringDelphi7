unit NumIntf;

interface

type
  INumberProp = interface
    ['{B36C5800-8E59-11D0-98D0-444553540000}']
    function GetValue: Integer; stdcall;
    procedure SetValue (New: Integer); stdcall;
    procedure Increase; stdcall;
    property Value: Integer
      read GetValue write SetValue;
  end;

implementation

end.
 