unit TLibDemo_TLB;

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
// File generated on 10/8/2002 1:05:38 AM from Type Library described below.

// ************************************************************************  //
// Type Lib: E:\books\md7code\12\TLibDemo\Tlibdemo.tlb (1)
// LIBID: {89855B41-8EFE-11D0-98D0-444553540000}
// LCID: 0
// Helpfile: 
// HelpString: TLibDemo Library
// DepndLst: 
//   (1) v1.0 stdole, (C:\WINDOWS\System32\stdole32.tlb)
//   (2) v2.0 StdType, (C:\WINDOWS\System32\OLEPRO32.DLL)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, StdVCL, Variants;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  TLibDemoMajorVersion = 1;
  TLibDemoMinorVersion = 0;

  LIBID_TLibDemo: TGUID = '{89855B41-8EFE-11D0-98D0-444553540000}';

  IID_IFirstServer: TGUID = '{89855B42-8EFE-11D0-98D0-444553540000}';
  CLASS_FirstServer: TGUID = '{89855B43-8EFE-11D0-98D0-444553540000}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IFirstServer = interface;
  IFirstServerDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  FirstServer = IFirstServer;


// *********************************************************************//
// Interface: IFirstServer
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {89855B42-8EFE-11D0-98D0-444553540000}
// *********************************************************************//
  IFirstServer = interface(IDispatch)
    ['{89855B42-8EFE-11D0-98D0-444553540000}']
    procedure ChangeColor; safecall;
    function Get_Value: Integer; safecall;
    procedure Set_Value(Value: Integer); safecall;
    property Value: Integer read Get_Value write Set_Value;
  end;

// *********************************************************************//
// DispIntf:  IFirstServerDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {89855B42-8EFE-11D0-98D0-444553540000}
// *********************************************************************//
  IFirstServerDisp = dispinterface
    ['{89855B42-8EFE-11D0-98D0-444553540000}']
    procedure ChangeColor; dispid 1;
    property Value: Integer dispid 2;
  end;

// *********************************************************************//
// The Class CoFirstServer provides a Create and CreateRemote method to          
// create instances of the default interface IFirstServer exposed by              
// the CoClass FirstServer. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoFirstServer = class
    class function Create: IFirstServer;
    class function CreateRemote(const MachineName: string): IFirstServer;
  end;

implementation

uses ComObj;

class function CoFirstServer.Create: IFirstServer;
begin
  Result := CreateComObject(CLASS_FirstServer) as IFirstServer;
end;

class function CoFirstServer.CreateRemote(const MachineName: string): IFirstServer;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_FirstServer) as IFirstServer;
end;

end.
