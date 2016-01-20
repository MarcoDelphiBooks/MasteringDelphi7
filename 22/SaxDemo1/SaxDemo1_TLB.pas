unit SaxDemo1_TLB;

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

// PASTLWTR : $Revision:   1.130  $
// File generated on 6/6/2001 3:07:42 AM from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\md6code\23\SaxDemo1\SaxDemo1.tlb (1)
// LIBID: {1245288D-E478-4B1A-906A-3B02348FDC12}
// LCID: 0
// Helpfile: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINDOWS\System32\stdole2.tlb)
//   (2) v4.0 StdVCL, (C:\WINDOWS\system32\stdvcl40.dll)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}

interface

uses ActiveX, Classes, Graphics, StdVCL, Variants, Windows;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  SaxDemo1MajorVersion = 1;
  SaxDemo1MinorVersion = 0;

  LIBID_SaxDemo1: TGUID = '{1245288D-E478-4B1A-906A-3B02348FDC12}';

  IID_ISaxHandler: TGUID = '{A04AE13E-7260-444B-BA43-31CC16D822A7}';
  CLASS_SaxHandler: TGUID = '{4629C36E-6478-41E5-A893-B86DA7BFB78C}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  ISaxHandler = interface;
  ISaxHandlerDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  SaxHandler = ISaxHandler;


// *********************************************************************//
// Interface: ISaxHandler
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A04AE13E-7260-444B-BA43-31CC16D822A7}
// *********************************************************************//
  ISaxHandler = interface(IDispatch)
    ['{A04AE13E-7260-444B-BA43-31CC16D822A7}']
  end;

// *********************************************************************//
// DispIntf:  ISaxHandlerDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A04AE13E-7260-444B-BA43-31CC16D822A7}
// *********************************************************************//
  ISaxHandlerDisp = dispinterface
    ['{A04AE13E-7260-444B-BA43-31CC16D822A7}']
  end;

// *********************************************************************//
// The Class CoSaxHandler provides a Create and CreateRemote method to          
// create instances of the default interface ISaxHandler exposed by              
// the CoClass SaxHandler. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoSaxHandler = class
    class function Create: ISaxHandler;
    class function CreateRemote(const MachineName: string): ISaxHandler;
  end;

implementation

uses ComObj;

class function CoSaxHandler.Create: ISaxHandler;
begin
  Result := CreateComObject(CLASS_SaxHandler) as ISaxHandler;
end;

class function CoSaxHandler.CreateRemote(const MachineName: string): ISaxHandler;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SaxHandler) as ISaxHandler;
end;

end.
