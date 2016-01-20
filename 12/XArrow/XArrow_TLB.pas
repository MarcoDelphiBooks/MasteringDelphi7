unit XArrow_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : 1.2
// File generated on 10/8/2002 11:14:20 AM from Type Library described below.

// ************************************************************************  //
// Type Lib: E:\books\md7code\12\XArrow\XArrow.tlb (1)
// LIBID: {482B2140-4133-11D3-B9F1-00000100A27B}
// LCID: 0
// Helpfile: 
// HelpString: XArrow Library
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINDOWS\System32\stdole2.tlb)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, OleCtrls, StdVCL, Variants;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  XArrowMajorVersion = 1;
  XArrowMinorVersion = 0;

  LIBID_XArrow: TGUID = '{482B2140-4133-11D3-B9F1-00000100A27B}';

  IID_IMdWArrowX: TGUID = '{482B2141-4133-11D3-B9F1-00000100A27B}';
  DIID_IMdWArrowXEvents: TGUID = '{482B2143-4133-11D3-B9F1-00000100A27B}';
  CLASS_MdWArrowX: TGUID = '{482B2145-4133-11D3-B9F1-00000100A27B}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library                    
// *********************************************************************//
// Constants for enum TxMdWArrowDir
type
  TxMdWArrowDir = TOleEnum;
const
  adUp = $00000000;
  adLeft = $00000001;
  adDown = $00000002;
  adRight = $00000003;

// Constants for enum TxMouseButton
type
  TxMouseButton = TOleEnum;
const
  mbLeft = $00000000;
  mbRight = $00000001;
  mbMiddle = $00000002;

type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IMdWArrowX = interface;
  IMdWArrowXDisp = dispinterface;
  IMdWArrowXEvents = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  MdWArrowX = IMdWArrowX;


// *********************************************************************//
// Interface: IMdWArrowX
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {482B2141-4133-11D3-B9F1-00000100A27B}
// *********************************************************************//
  IMdWArrowX = interface(IDispatch)
    ['{482B2141-4133-11D3-B9F1-00000100A27B}']
    function Get_Direction: TxMdWArrowDir; safecall;
    procedure Set_Direction(Value: TxMdWArrowDir); safecall;
    function Get_ArrowHeight: Integer; safecall;
    procedure Set_ArrowHeight(Value: Integer); safecall;
    function Get_Filled: WordBool; safecall;
    procedure Set_Filled(Value: WordBool); safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    function Get_Cursor: Smallint; safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    function Get_FillColor: Integer; safecall;
    procedure Set_FillColor(Value: Integer); safecall;
    function Get_PenColor: Integer; safecall;
    procedure Set_PenColor(Value: Integer); safecall;
    property Direction: TxMdWArrowDir read Get_Direction write Set_Direction;
    property ArrowHeight: Integer read Get_ArrowHeight write Set_ArrowHeight;
    property Filled: WordBool read Get_Filled write Set_Filled;
    property DoubleBuffered: WordBool read Get_DoubleBuffered write Set_DoubleBuffered;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property Cursor: Smallint read Get_Cursor write Set_Cursor;
    property FillColor: Integer read Get_FillColor write Set_FillColor;
    property PenColor: Integer read Get_PenColor write Set_PenColor;
  end;

// *********************************************************************//
// DispIntf:  IMdWArrowXDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {482B2141-4133-11D3-B9F1-00000100A27B}
// *********************************************************************//
  IMdWArrowXDisp = dispinterface
    ['{482B2141-4133-11D3-B9F1-00000100A27B}']
    property Direction: TxMdWArrowDir dispid 1;
    property ArrowHeight: Integer dispid 2;
    property Filled: WordBool dispid 3;
    property DoubleBuffered: WordBool dispid 4;
    property Enabled: WordBool dispid -514;
    property Visible: WordBool dispid 13;
    property Cursor: Smallint dispid 14;
    property FillColor: Integer dispid 20;
    property PenColor: Integer dispid 21;
  end;

// *********************************************************************//
// DispIntf:  IMdWArrowXEvents
// Flags:     (4096) Dispatchable
// GUID:      {482B2143-4133-11D3-B9F1-00000100A27B}
// *********************************************************************//
  IMdWArrowXEvents = dispinterface
    ['{482B2143-4133-11D3-B9F1-00000100A27B}']
    procedure OnClick; dispid 1;
    procedure OnArrowDblClick; dispid 8;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TMdWArrowX
// Help String      : MdWArrowX Control
// Default Interface: IMdWArrowX
// Def. Intf. DISP? : No
// Event   Interface: IMdWArrowXEvents
// TypeFlags        : (34) CanCreate Control
// *********************************************************************//
  TMdWArrowX = class(TOleControl)
  private
    FOnClick: TNotifyEvent;
    FOnArrowDblClick: TNotifyEvent;
    FIntf: IMdWArrowX;
    function  GetControlInterface: IMdWArrowX;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    property  ControlInterface: IMdWArrowX read GetControlInterface;
    property  DefaultInterface: IMdWArrowX read GetControlInterface;
    property DoubleBuffered: WordBool index 4 read GetWordBoolProp write SetWordBoolProp;
    property Enabled: WordBool index -514 read GetWordBoolProp write SetWordBoolProp;
    property Visible: WordBool index 13 read GetWordBoolProp write SetWordBoolProp;
  published
    property Anchors;
    property  TabStop;
    property  Align;
    property  DragCursor;
    property  DragMode;
    property  ParentShowHint;
    property  PopupMenu;
    property  ShowHint;
    property  TabOrder;
    property  OnDragDrop;
    property  OnDragOver;
    property  OnEndDrag;
    property  OnEnter;
    property  OnExit;
    property  OnStartDrag;
    property Direction: TOleEnum index 1 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property ArrowHeight: Integer index 2 read GetIntegerProp write SetIntegerProp stored False;
    property Filled: WordBool index 3 read GetWordBoolProp write SetWordBoolProp stored False;
    property Cursor: Smallint index 14 read GetSmallintProp write SetSmallintProp stored False;
    property FillColor: Integer index 20 read GetIntegerProp write SetIntegerProp stored False;
    property PenColor: Integer index 21 read GetIntegerProp write SetIntegerProp stored False;
    property OnClick: TNotifyEvent read FOnClick write FOnClick;
    property OnArrowDblClick: TNotifyEvent read FOnArrowDblClick write FOnArrowDblClick;
  end;

procedure Register;

resourcestring
  dtlServerPage = 'Servers';

  dtlOcxPage = 'ActiveX';

implementation

uses ComObj;

procedure TMdWArrowX.InitControlData;
const
  CEventDispIDs: array [0..1] of DWORD = (
    $00000001, $00000008);
  CControlData: TControlData2 = (
    ClassID: '{482B2145-4133-11D3-B9F1-00000100A27B}';
    EventIID: '{482B2143-4133-11D3-B9F1-00000100A27B}';
    EventCount: 2;
    EventDispIDs: @CEventDispIDs;
    LicenseKey: nil (*HR:$8007007E*);
    Flags: $00000008;
    Version: 401);
begin
  ControlData := @CControlData;
  TControlData2(CControlData).FirstEventOfs := Cardinal(@@FOnClick) - Cardinal(Self);
end;

procedure TMdWArrowX.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as IMdWArrowX;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TMdWArrowX.GetControlInterface: IMdWArrowX;
begin
  CreateControl;
  Result := FIntf;
end;

procedure Register;
begin
  RegisterComponents(dtlOcxPage, [TMdWArrowX]);
end;

end.
