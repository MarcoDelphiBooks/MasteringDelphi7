unit ComPlus1_TLB;

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

// PASTLWTR : $Revision:   1.118  $
// File generated on 4/28/2001 12:22:43 PM from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\md6code\20\ComPlus1\ComPlus1.tlb (1)
// LIBID: {AF035833-33FA-47F3-A0DF-769234960CCB}
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

uses ActiveX, Classes, Graphics, StdVcl, Variants, Windows;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  ComPlus1MajorVersion = 1;
  ComPlus1MinorVersion = 0;

  LIBID_ComPlus1: TGUID = '{AF035833-33FA-47F3-A0DF-769234960CCB}';

  IID_IComPlus1Object: TGUID = '{16D85A0C-9B8F-46E6-821F-E72E5A0294BC}';
  CLASS_ComPlus1Object: TGUID = '{3E930EF3-CE24-474C-9A33-EF1F02E2930A}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IComPlus1Object = interface;
  IComPlus1ObjectDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  ComPlus1Object = IComPlus1Object;


// *********************************************************************//
// Interface: IComPlus1Object
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {16D85A0C-9B8F-46E6-821F-E72E5A0294BC}
// *********************************************************************//
  IComPlus1Object = interface(IDispatch)
    ['{16D85A0C-9B8F-46E6-821F-E72E5A0294BC}']
    function  Get_Value: Integer; safecall;
    procedure Set_Value(Value: Integer); safecall;
    procedure Increase(Amount: Integer); safecall;
    function  AsString: WideString; safecall;
    property Value: Integer read Get_Value write Set_Value;
  end;

// *********************************************************************//
// DispIntf:  IComPlus1ObjectDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {16D85A0C-9B8F-46E6-821F-E72E5A0294BC}
// *********************************************************************//
  IComPlus1ObjectDisp = dispinterface
    ['{16D85A0C-9B8F-46E6-821F-E72E5A0294BC}']
    property Value: Integer dispid 1;
    procedure Increase(Amount: Integer); dispid 2;
    function  AsString: WideString; dispid 3;
  end;

// *********************************************************************//
// The Class CoComPlus1Object provides a Create and CreateRemote method to          
// create instances of the default interface IComPlus1Object exposed by              
// the CoClass ComPlus1Object. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoComPlus1Object = class
    class function Create: IComPlus1Object;
    class function CreateRemote(const MachineName: string): IComPlus1Object;
  end;

implementation

uses ComObj;

class function CoComPlus1Object.Create: IComPlus1Object;
begin
  Result := CreateComObject(CLASS_ComPlus1Object) as IComPlus1Object;
end;

class function CoComPlus1Object.CreateRemote(const MachineName: string): IComPlus1Object;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ComPlus1Object) as IComPlus1Object;
end;

end.
