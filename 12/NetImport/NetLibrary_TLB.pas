unit NetLibrary_TLB;

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
// File generated on 10/8/2002 3:56:45 PM from Type Library described below.

// ************************************************************************  //
// Type Lib: netlibrary.dll (1)
// LIBID: {9DF79128-D535-374E-A80C-50327959B32C}
// LCID: 0
// Helpfile: 
// HelpString: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINDOWS\System32\stdole2.tlb)
//   (2) v1.0 mscorlib, (C:\WINDOWS\Microsoft.NET\Framework\v1.0.3705\mscorlib.tlb)
// Errors:
//   Hint: TypeInfo '@TClass' changed to '_TClass'
//   Hint: TypeInfo '@Text' changed to '_Text'
//   Hint: TypeInfo '@TNumber' changed to '_TNumber'
//   Hint: TypeInfo '@FinalizeHandler' changed to '_FinalizeHandler'
//   Hint: TypeInfo '_Text' changed to '_Text1'
//   Hint: TypeInfo '_@TClass' changed to '__TClass'
//   Hint: TypeInfo '_TNumber' changed to '_TNumber1'
//   Hint: TypeInfo '_@Text' changed to '__Text'
//   Hint: TypeInfo '_@TNumber' changed to '__TNumber'
//   Hint: TypeInfo '_@FinalizeHandler' changed to '__FinalizeHandler'
//   Error creating palette bitmap of (TText) : Server C:\WINDOWS\System32\mscoree.dll contains no icons
//   Error creating palette bitmap of (TTNumber) : Server C:\WINDOWS\System32\mscoree.dll contains no icons
//   Error creating palette bitmap of (TBorland_Delphi_System_Unit) : Server C:\WINDOWS\System32\mscoree.dll contains no icons
//   Error creating palette bitmap of (TNetNumberClass_Unit) : Server C:\WINDOWS\System32\mscoree.dll contains no icons
//   Error creating palette bitmap of (TNetLibrary_Unit) : Server C:\WINDOWS\System32\mscoree.dll contains no icons
// ************************************************************************ //
// *************************************************************************//
// NOTE:                                                                      
// Items guarded by $IFDEF_LIVE_SERVER_AT_DESIGN_TIME are used by properties  
// which return objects that may need to be explicitly created via a function 
// call prior to any access via the property. These items have been disabled  
// in order to prevent accidental use from within the object inspector. You   
// may enable them by defining LIVE_SERVER_AT_DESIGN_TIME or by selectively   
// removing them from the $IFDEF blocks. However, such items must still be    
// programmatically created via a method of the appropriate CoClass before    
// they can be used.                                                          
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, mscorlib_TLB, OleServer, StdVCL, Variants;
  


// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  NetLibraryMajorVersion = 1;
  NetLibraryMinorVersion = 0;

  LIBID_NetLibrary: TGUID = '{9DF79128-D535-374E-A80C-50327959B32C}';

  IID__Text1: TGUID = '{6682B647-3B13-30EA-B364-C601AEF43B0B}';
  IID___TClass: TGUID = '{B93EE951-7A0B-3263-B9CB-E4442247EF9B}';
  IID_ITextDeviceFactory: TGUID = '{1A418A20-950B-32C5-AA7D-9F3ABBA68EF7}';
  IID__TNumber1: TGUID = '{64992554-80BA-3D9F-BFBC-2306D2B10191}';
  IID_INumber: TGUID = '{F853E7B1-D0F3-33DE-B03C-AC8EEA8A0DFF}';
  IID___Text: TGUID = '{B4643373-8421-31CA-83EC-588142CCEC3B}';
  IID___TNumber: TGUID = '{8B1255F7-AB8E-3A7B-A62B-B895AE2B64A7}';
  IID___FinalizeHandler: TGUID = '{BF985481-2345-3221-9F0F-9AE2D619BB79}';
  IID__Borland_Delphi_System_Unit: TGUID = '{C8AA32E8-2F5C-3DBD-A82A-73B073D4174A}';
  IID__NetNumberClass_Unit: TGUID = '{5B4B17F8-9512-361A-98B3-835C9270EA4D}';
  IID__NetLibrary_Unit: TGUID = '{12A93F11-F0E7-3D30-BC32-9322A989C319}';
  CLASS_Text: TGUID = '{27DF9B70-47B7-3326-B694-C8E1B9D9790F}';
  CLASS__TClass: TGUID = '{2922DBD0-1E4A-31BE-81B9-7640107C3AED}';
  CLASS_TNumber: TGUID = '{0FF4FB93-DEB6-39A8-B769-3D3B85D1AB10}';
  CLASS__Text: TGUID = '{FF16DC8E-9351-3E33-B5B0-F218EC3280D9}';
  CLASS__TNumber: TGUID = '{8C5EC693-BE28-3AB4-BAEC-7220E88BBA51}';
  CLASS__FinalizeHandler: TGUID = '{B4419DA1-7674-3834-A14E-49815225DF58}';
  CLASS_Borland_Delphi_System_Unit: TGUID = '{44EE1E8B-A1ED-3B95-8C2A-D658E84E15AB}';
  CLASS_NetNumberClass_Unit: TGUID = '{A1C737F4-5EF5-3D96-8BC7-F70523A29248}';
  CLASS_NetLibrary_Unit: TGUID = '{6958E056-B6A0-31BA-9021-3A567E025203}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library                    
// *********************************************************************//
// Constants for enum TTextLineBreakStyle
type
  TTextLineBreakStyle = TOleEnum;
const
  TTextLineBreakStyle_tlbsLF = $00000000;
  TTextLineBreakStyle_tlbsCRLF = $00000001;

type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  _Text1 = interface;
  _Text1Disp = dispinterface;
  __TClass = interface;
  __TClassDisp = dispinterface;
  ITextDeviceFactory = interface;
  ITextDeviceFactoryDisp = dispinterface;
  _TNumber1 = interface;
  _TNumber1Disp = dispinterface;
  INumber = interface;
  INumberDisp = dispinterface;
  __Text = interface;
  __TextDisp = dispinterface;
  __TNumber = interface;
  __TNumberDisp = dispinterface;
  __FinalizeHandler = interface;
  __FinalizeHandlerDisp = dispinterface;
  _Borland_Delphi_System_Unit = interface;
  _Borland_Delphi_System_UnitDisp = dispinterface;
  _NetNumberClass_Unit = interface;
  _NetNumberClass_UnitDisp = dispinterface;
  _NetLibrary_Unit = interface;
  _NetLibrary_UnitDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  Text = _Text1;
  _TClass = __TClass;
  TNumber = _TNumber1;
  _Text = __Text;
  _TNumber = __TNumber;
  _FinalizeHandler = __FinalizeHandler;
  Borland_Delphi_System_Unit = _Borland_Delphi_System_Unit;
  NetNumberClass_Unit = _NetNumberClass_Unit;
  NetLibrary_Unit = _NetLibrary_Unit;


// *********************************************************************//
// Interface: _Text1
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {6682B647-3B13-30EA-B364-C601AEF43B0B}
// *********************************************************************//
  _Text1 = interface(IDispatch)
    ['{6682B647-3B13-30EA-B364-C601AEF43B0B}']
  end;

// *********************************************************************//
// DispIntf:  _Text1Disp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {6682B647-3B13-30EA-B364-C601AEF43B0B}
// *********************************************************************//
  _Text1Disp = dispinterface
    ['{6682B647-3B13-30EA-B364-C601AEF43B0B}']
  end;

// *********************************************************************//
// Interface: __TClass
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {B93EE951-7A0B-3263-B9CB-E4442247EF9B}
// *********************************************************************//
  __TClass = interface(IDispatch)
    ['{B93EE951-7A0B-3263-B9CB-E4442247EF9B}']
  end;

// *********************************************************************//
// DispIntf:  __TClassDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {B93EE951-7A0B-3263-B9CB-E4442247EF9B}
// *********************************************************************//
  __TClassDisp = dispinterface
    ['{B93EE951-7A0B-3263-B9CB-E4442247EF9B}']
  end;

// *********************************************************************//
// Interface: ITextDeviceFactory
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {1A418A20-950B-32C5-AA7D-9F3ABBA68EF7}
// *********************************************************************//
  ITextDeviceFactory = interface(IDispatch)
    ['{1A418A20-950B-32C5-AA7D-9F3ABBA68EF7}']
    function Open(const p1: _Text1; p2: Word): Integer; safecall;
    function Close(const p1: _Text1): Integer; safecall;
  end;

// *********************************************************************//
// DispIntf:  ITextDeviceFactoryDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {1A418A20-950B-32C5-AA7D-9F3ABBA68EF7}
// *********************************************************************//
  ITextDeviceFactoryDisp = dispinterface
    ['{1A418A20-950B-32C5-AA7D-9F3ABBA68EF7}']
    function Open(const p1: _Text1; p2: {??Word}OleVariant): Integer; dispid 1610743808;
    function Close(const p1: _Text1): Integer; dispid 1610743809;
  end;

// *********************************************************************//
// Interface: _TNumber1
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {64992554-80BA-3D9F-BFBC-2306D2B10191}
// *********************************************************************//
  _TNumber1 = interface(IDispatch)
    ['{64992554-80BA-3D9F-BFBC-2306D2B10191}']
  end;

// *********************************************************************//
// DispIntf:  _TNumber1Disp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {64992554-80BA-3D9F-BFBC-2306D2B10191}
// *********************************************************************//
  _TNumber1Disp = dispinterface
    ['{64992554-80BA-3D9F-BFBC-2306D2B10191}']
  end;

// *********************************************************************//
// Interface: INumber
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {F853E7B1-D0F3-33DE-B03C-AC8EEA8A0DFF}
// *********************************************************************//
  INumber = interface(IDispatch)
    ['{F853E7B1-D0F3-33DE-B03C-AC8EEA8A0DFF}']
    function GetValue: Integer; safecall;
    procedure SetValue(p1: Integer); safecall;
    procedure Increase; safecall;
  end;

// *********************************************************************//
// DispIntf:  INumberDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {F853E7B1-D0F3-33DE-B03C-AC8EEA8A0DFF}
// *********************************************************************//
  INumberDisp = dispinterface
    ['{F853E7B1-D0F3-33DE-B03C-AC8EEA8A0DFF}']
    function GetValue: Integer; dispid 1610743808;
    procedure SetValue(p1: Integer); dispid 1610743809;
    procedure Increase; dispid 1610743810;
  end;

// *********************************************************************//
// Interface: __Text
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {B4643373-8421-31CA-83EC-588142CCEC3B}
// *********************************************************************//
  __Text = interface(IDispatch)
    ['{B4643373-8421-31CA-83EC-588142CCEC3B}']
  end;

// *********************************************************************//
// DispIntf:  __TextDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {B4643373-8421-31CA-83EC-588142CCEC3B}
// *********************************************************************//
  __TextDisp = dispinterface
    ['{B4643373-8421-31CA-83EC-588142CCEC3B}']
  end;

// *********************************************************************//
// Interface: __TNumber
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {8B1255F7-AB8E-3A7B-A62B-B895AE2B64A7}
// *********************************************************************//
  __TNumber = interface(IDispatch)
    ['{8B1255F7-AB8E-3A7B-A62B-B895AE2B64A7}']
  end;

// *********************************************************************//
// DispIntf:  __TNumberDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {8B1255F7-AB8E-3A7B-A62B-B895AE2B64A7}
// *********************************************************************//
  __TNumberDisp = dispinterface
    ['{8B1255F7-AB8E-3A7B-A62B-B895AE2B64A7}']
  end;

// *********************************************************************//
// Interface: __FinalizeHandler
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {BF985481-2345-3221-9F0F-9AE2D619BB79}
// *********************************************************************//
  __FinalizeHandler = interface(IDispatch)
    ['{BF985481-2345-3221-9F0F-9AE2D619BB79}']
  end;

// *********************************************************************//
// DispIntf:  __FinalizeHandlerDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {BF985481-2345-3221-9F0F-9AE2D619BB79}
// *********************************************************************//
  __FinalizeHandlerDisp = dispinterface
    ['{BF985481-2345-3221-9F0F-9AE2D619BB79}']
  end;

// *********************************************************************//
// Interface: _Borland_Delphi_System_Unit
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {C8AA32E8-2F5C-3DBD-A82A-73B073D4174A}
// *********************************************************************//
  _Borland_Delphi_System_Unit = interface(IDispatch)
    ['{C8AA32E8-2F5C-3DBD-A82A-73B073D4174A}']
  end;

// *********************************************************************//
// DispIntf:  _Borland_Delphi_System_UnitDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {C8AA32E8-2F5C-3DBD-A82A-73B073D4174A}
// *********************************************************************//
  _Borland_Delphi_System_UnitDisp = dispinterface
    ['{C8AA32E8-2F5C-3DBD-A82A-73B073D4174A}']
  end;

// *********************************************************************//
// Interface: _NetNumberClass_Unit
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {5B4B17F8-9512-361A-98B3-835C9270EA4D}
// *********************************************************************//
  _NetNumberClass_Unit = interface(IDispatch)
    ['{5B4B17F8-9512-361A-98B3-835C9270EA4D}']
  end;

// *********************************************************************//
// DispIntf:  _NetNumberClass_UnitDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {5B4B17F8-9512-361A-98B3-835C9270EA4D}
// *********************************************************************//
  _NetNumberClass_UnitDisp = dispinterface
    ['{5B4B17F8-9512-361A-98B3-835C9270EA4D}']
  end;

// *********************************************************************//
// Interface: _NetLibrary_Unit
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {12A93F11-F0E7-3D30-BC32-9322A989C319}
// *********************************************************************//
  _NetLibrary_Unit = interface(IDispatch)
    ['{12A93F11-F0E7-3D30-BC32-9322A989C319}']
  end;

// *********************************************************************//
// DispIntf:  _NetLibrary_UnitDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {12A93F11-F0E7-3D30-BC32-9322A989C319}
// *********************************************************************//
  _NetLibrary_UnitDisp = dispinterface
    ['{12A93F11-F0E7-3D30-BC32-9322A989C319}']
  end;

// *********************************************************************//
// The Class CoText provides a Create and CreateRemote method to          
// create instances of the default interface _Text1 exposed by              
// the CoClass Text. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoText = class
    class function Create: _Text1;
    class function CreateRemote(const MachineName: string): _Text1;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TText
// Help String      : 
// Default Interface: _Text1
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TTextProperties= class;
{$ENDIF}
  TText = class(TOleServer)
  private
    FIntf:        _Text1;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TTextProperties;
    function      GetServerProperties: TTextProperties;
{$ENDIF}
    function      GetDefaultInterface: _Text1;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _Text1);
    procedure Disconnect; override;
    property DefaultInterface: _Text1 read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TTextProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TText
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TTextProperties = class(TPersistent)
  private
    FServer:    TText;
    function    GetDefaultInterface: _Text1;
    constructor Create(AServer: TText);
  protected
  public
    property DefaultInterface: _Text1 read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class Co_TClass provides a Create and CreateRemote method to          
// create instances of the default interface __TClass exposed by              
// the CoClass _TClass. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  Co_TClass = class
    class function Create: __TClass;
    class function CreateRemote(const MachineName: string): __TClass;
  end;

// *********************************************************************//
// The Class CoTNumber provides a Create and CreateRemote method to          
// create instances of the default interface _TNumber1 exposed by              
// the CoClass TNumber. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoTNumber = class
    class function Create: _TNumber1;
    class function CreateRemote(const MachineName: string): _TNumber1;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TTNumber
// Help String      : 
// Default Interface: _TNumber1
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TTNumberProperties= class;
{$ENDIF}
  TTNumber = class(TOleServer)
  private
    FIntf:        _TNumber1;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TTNumberProperties;
    function      GetServerProperties: TTNumberProperties;
{$ENDIF}
    function      GetDefaultInterface: _TNumber1;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _TNumber1);
    procedure Disconnect; override;
    property DefaultInterface: _TNumber1 read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TTNumberProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TTNumber
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TTNumberProperties = class(TPersistent)
  private
    FServer:    TTNumber;
    function    GetDefaultInterface: _TNumber1;
    constructor Create(AServer: TTNumber);
  protected
  public
    property DefaultInterface: _TNumber1 read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class Co_Text provides a Create and CreateRemote method to          
// create instances of the default interface __Text exposed by              
// the CoClass _Text. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  Co_Text = class
    class function Create: __Text;
    class function CreateRemote(const MachineName: string): __Text;
  end;

// *********************************************************************//
// The Class Co_TNumber provides a Create and CreateRemote method to          
// create instances of the default interface __TNumber exposed by              
// the CoClass _TNumber. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  Co_TNumber = class
    class function Create: __TNumber;
    class function CreateRemote(const MachineName: string): __TNumber;
  end;

// *********************************************************************//
// The Class Co_FinalizeHandler provides a Create and CreateRemote method to          
// create instances of the default interface __FinalizeHandler exposed by              
// the CoClass _FinalizeHandler. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  Co_FinalizeHandler = class
    class function Create: __FinalizeHandler;
    class function CreateRemote(const MachineName: string): __FinalizeHandler;
  end;

// *********************************************************************//
// The Class CoBorland_Delphi_System_Unit provides a Create and CreateRemote method to          
// create instances of the default interface _Borland_Delphi_System_Unit exposed by              
// the CoClass Borland_Delphi_System_Unit. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoBorland_Delphi_System_Unit = class
    class function Create: _Borland_Delphi_System_Unit;
    class function CreateRemote(const MachineName: string): _Borland_Delphi_System_Unit;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TBorland_Delphi_System_Unit
// Help String      : 
// Default Interface: _Borland_Delphi_System_Unit
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TBorland_Delphi_System_UnitProperties= class;
{$ENDIF}
  TBorland_Delphi_System_Unit = class(TOleServer)
  private
    FIntf:        _Borland_Delphi_System_Unit;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TBorland_Delphi_System_UnitProperties;
    function      GetServerProperties: TBorland_Delphi_System_UnitProperties;
{$ENDIF}
    function      GetDefaultInterface: _Borland_Delphi_System_Unit;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _Borland_Delphi_System_Unit);
    procedure Disconnect; override;
    property DefaultInterface: _Borland_Delphi_System_Unit read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TBorland_Delphi_System_UnitProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TBorland_Delphi_System_Unit
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TBorland_Delphi_System_UnitProperties = class(TPersistent)
  private
    FServer:    TBorland_Delphi_System_Unit;
    function    GetDefaultInterface: _Borland_Delphi_System_Unit;
    constructor Create(AServer: TBorland_Delphi_System_Unit);
  protected
  public
    property DefaultInterface: _Borland_Delphi_System_Unit read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoNetNumberClass_Unit provides a Create and CreateRemote method to          
// create instances of the default interface _NetNumberClass_Unit exposed by              
// the CoClass NetNumberClass_Unit. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoNetNumberClass_Unit = class
    class function Create: _NetNumberClass_Unit;
    class function CreateRemote(const MachineName: string): _NetNumberClass_Unit;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TNetNumberClass_Unit
// Help String      : 
// Default Interface: _NetNumberClass_Unit
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TNetNumberClass_UnitProperties= class;
{$ENDIF}
  TNetNumberClass_Unit = class(TOleServer)
  private
    FIntf:        _NetNumberClass_Unit;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TNetNumberClass_UnitProperties;
    function      GetServerProperties: TNetNumberClass_UnitProperties;
{$ENDIF}
    function      GetDefaultInterface: _NetNumberClass_Unit;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _NetNumberClass_Unit);
    procedure Disconnect; override;
    property DefaultInterface: _NetNumberClass_Unit read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TNetNumberClass_UnitProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TNetNumberClass_Unit
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TNetNumberClass_UnitProperties = class(TPersistent)
  private
    FServer:    TNetNumberClass_Unit;
    function    GetDefaultInterface: _NetNumberClass_Unit;
    constructor Create(AServer: TNetNumberClass_Unit);
  protected
  public
    property DefaultInterface: _NetNumberClass_Unit read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoNetLibrary_Unit provides a Create and CreateRemote method to          
// create instances of the default interface _NetLibrary_Unit exposed by              
// the CoClass NetLibrary_Unit. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoNetLibrary_Unit = class
    class function Create: _NetLibrary_Unit;
    class function CreateRemote(const MachineName: string): _NetLibrary_Unit;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TNetLibrary_Unit
// Help String      : 
// Default Interface: _NetLibrary_Unit
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TNetLibrary_UnitProperties= class;
{$ENDIF}
  TNetLibrary_Unit = class(TOleServer)
  private
    FIntf:        _NetLibrary_Unit;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TNetLibrary_UnitProperties;
    function      GetServerProperties: TNetLibrary_UnitProperties;
{$ENDIF}
    function      GetDefaultInterface: _NetLibrary_Unit;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _NetLibrary_Unit);
    procedure Disconnect; override;
    property DefaultInterface: _NetLibrary_Unit read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TNetLibrary_UnitProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TNetLibrary_Unit
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TNetLibrary_UnitProperties = class(TPersistent)
  private
    FServer:    TNetLibrary_Unit;
    function    GetDefaultInterface: _NetLibrary_Unit;
    constructor Create(AServer: TNetLibrary_Unit);
  protected
  public
    property DefaultInterface: _NetLibrary_Unit read GetDefaultInterface;
  published
  end;
{$ENDIF}


procedure Register;

resourcestring
  dtlServerPage = 'Servers';

  dtlOcxPage = 'ActiveX';

implementation

uses ComObj;

class function CoText.Create: _Text1;
begin
  Result := CreateComObject(CLASS_Text) as _Text1;
end;

class function CoText.CreateRemote(const MachineName: string): _Text1;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Text) as _Text1;
end;

procedure TText.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{27DF9B70-47B7-3326-B694-C8E1B9D9790F}';
    IntfIID:   '{6682B647-3B13-30EA-B364-C601AEF43B0B}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TText.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as _Text1;
  end;
end;

procedure TText.ConnectTo(svrIntf: _Text1);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TText.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TText.GetDefaultInterface: _Text1;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TText.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TTextProperties.Create(Self);
{$ENDIF}
end;

destructor TText.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TText.GetServerProperties: TTextProperties;
begin
  Result := FProps;
end;
{$ENDIF}

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TTextProperties.Create(AServer: TText);
begin
  inherited Create;
  FServer := AServer;
end;

function TTextProperties.GetDefaultInterface: _Text1;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function Co_TClass.Create: __TClass;
begin
  Result := CreateComObject(CLASS__TClass) as __TClass;
end;

class function Co_TClass.CreateRemote(const MachineName: string): __TClass;
begin
  Result := CreateRemoteComObject(MachineName, CLASS__TClass) as __TClass;
end;

class function CoTNumber.Create: _TNumber1;
begin
  Result := CreateComObject(CLASS_TNumber) as _TNumber1;
end;

class function CoTNumber.CreateRemote(const MachineName: string): _TNumber1;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_TNumber) as _TNumber1;
end;

procedure TTNumber.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{0FF4FB93-DEB6-39A8-B769-3D3B85D1AB10}';
    IntfIID:   '{64992554-80BA-3D9F-BFBC-2306D2B10191}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TTNumber.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as _TNumber1;
  end;
end;

procedure TTNumber.ConnectTo(svrIntf: _TNumber1);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TTNumber.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TTNumber.GetDefaultInterface: _TNumber1;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TTNumber.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TTNumberProperties.Create(Self);
{$ENDIF}
end;

destructor TTNumber.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TTNumber.GetServerProperties: TTNumberProperties;
begin
  Result := FProps;
end;
{$ENDIF}

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TTNumberProperties.Create(AServer: TTNumber);
begin
  inherited Create;
  FServer := AServer;
end;

function TTNumberProperties.GetDefaultInterface: _TNumber1;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function Co_Text.Create: __Text;
begin
  Result := CreateComObject(CLASS__Text) as __Text;
end;

class function Co_Text.CreateRemote(const MachineName: string): __Text;
begin
  Result := CreateRemoteComObject(MachineName, CLASS__Text) as __Text;
end;

class function Co_TNumber.Create: __TNumber;
begin
  Result := CreateComObject(CLASS__TNumber) as __TNumber;
end;

class function Co_TNumber.CreateRemote(const MachineName: string): __TNumber;
begin
  Result := CreateRemoteComObject(MachineName, CLASS__TNumber) as __TNumber;
end;

class function Co_FinalizeHandler.Create: __FinalizeHandler;
begin
  Result := CreateComObject(CLASS__FinalizeHandler) as __FinalizeHandler;
end;

class function Co_FinalizeHandler.CreateRemote(const MachineName: string): __FinalizeHandler;
begin
  Result := CreateRemoteComObject(MachineName, CLASS__FinalizeHandler) as __FinalizeHandler;
end;

class function CoBorland_Delphi_System_Unit.Create: _Borland_Delphi_System_Unit;
begin
  Result := CreateComObject(CLASS_Borland_Delphi_System_Unit) as _Borland_Delphi_System_Unit;
end;

class function CoBorland_Delphi_System_Unit.CreateRemote(const MachineName: string): _Borland_Delphi_System_Unit;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Borland_Delphi_System_Unit) as _Borland_Delphi_System_Unit;
end;

procedure TBorland_Delphi_System_Unit.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{44EE1E8B-A1ED-3B95-8C2A-D658E84E15AB}';
    IntfIID:   '{C8AA32E8-2F5C-3DBD-A82A-73B073D4174A}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TBorland_Delphi_System_Unit.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as _Borland_Delphi_System_Unit;
  end;
end;

procedure TBorland_Delphi_System_Unit.ConnectTo(svrIntf: _Borland_Delphi_System_Unit);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TBorland_Delphi_System_Unit.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TBorland_Delphi_System_Unit.GetDefaultInterface: _Borland_Delphi_System_Unit;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TBorland_Delphi_System_Unit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TBorland_Delphi_System_UnitProperties.Create(Self);
{$ENDIF}
end;

destructor TBorland_Delphi_System_Unit.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TBorland_Delphi_System_Unit.GetServerProperties: TBorland_Delphi_System_UnitProperties;
begin
  Result := FProps;
end;
{$ENDIF}

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TBorland_Delphi_System_UnitProperties.Create(AServer: TBorland_Delphi_System_Unit);
begin
  inherited Create;
  FServer := AServer;
end;

function TBorland_Delphi_System_UnitProperties.GetDefaultInterface: _Borland_Delphi_System_Unit;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoNetNumberClass_Unit.Create: _NetNumberClass_Unit;
begin
  Result := CreateComObject(CLASS_NetNumberClass_Unit) as _NetNumberClass_Unit;
end;

class function CoNetNumberClass_Unit.CreateRemote(const MachineName: string): _NetNumberClass_Unit;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_NetNumberClass_Unit) as _NetNumberClass_Unit;
end;

procedure TNetNumberClass_Unit.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{A1C737F4-5EF5-3D96-8BC7-F70523A29248}';
    IntfIID:   '{5B4B17F8-9512-361A-98B3-835C9270EA4D}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TNetNumberClass_Unit.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as _NetNumberClass_Unit;
  end;
end;

procedure TNetNumberClass_Unit.ConnectTo(svrIntf: _NetNumberClass_Unit);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TNetNumberClass_Unit.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TNetNumberClass_Unit.GetDefaultInterface: _NetNumberClass_Unit;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TNetNumberClass_Unit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TNetNumberClass_UnitProperties.Create(Self);
{$ENDIF}
end;

destructor TNetNumberClass_Unit.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TNetNumberClass_Unit.GetServerProperties: TNetNumberClass_UnitProperties;
begin
  Result := FProps;
end;
{$ENDIF}

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TNetNumberClass_UnitProperties.Create(AServer: TNetNumberClass_Unit);
begin
  inherited Create;
  FServer := AServer;
end;

function TNetNumberClass_UnitProperties.GetDefaultInterface: _NetNumberClass_Unit;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoNetLibrary_Unit.Create: _NetLibrary_Unit;
begin
  Result := CreateComObject(CLASS_NetLibrary_Unit) as _NetLibrary_Unit;
end;

class function CoNetLibrary_Unit.CreateRemote(const MachineName: string): _NetLibrary_Unit;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_NetLibrary_Unit) as _NetLibrary_Unit;
end;

procedure TNetLibrary_Unit.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{6958E056-B6A0-31BA-9021-3A567E025203}';
    IntfIID:   '{12A93F11-F0E7-3D30-BC32-9322A989C319}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TNetLibrary_Unit.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as _NetLibrary_Unit;
  end;
end;

procedure TNetLibrary_Unit.ConnectTo(svrIntf: _NetLibrary_Unit);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TNetLibrary_Unit.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TNetLibrary_Unit.GetDefaultInterface: _NetLibrary_Unit;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TNetLibrary_Unit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TNetLibrary_UnitProperties.Create(Self);
{$ENDIF}
end;

destructor TNetLibrary_Unit.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TNetLibrary_Unit.GetServerProperties: TNetLibrary_UnitProperties;
begin
  Result := FProps;
end;
{$ENDIF}

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TNetLibrary_UnitProperties.Create(AServer: TNetLibrary_Unit);
begin
  inherited Create;
  FServer := AServer;
end;

function TNetLibrary_UnitProperties.GetDefaultInterface: _NetLibrary_Unit;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

procedure Register;
begin
  RegisterComponents(dtlServerPage, [TText, TTNumber, TBorland_Delphi_System_Unit, TNetNumberClass_Unit, 
    TNetLibrary_Unit]);
end;

end.
