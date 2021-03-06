unit ListServ_TLB;

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
// File generated on 10/8/2002 12:03:48 AM from Type Library described below.

// ************************************************************************  //
// Type Lib: E:\books\md7code\12\ListServ\ListServ.tlb (1)
// LIBID: {3BDFE8EA-CA1A-4918-8643-8F8D5EE2371E}
// LCID: 0
// Helpfile: 
// HelpString: ListServ Library
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINDOWS\System32\stdole2.tlb)
//   (2) v4.0 StdVCL, (C:\WINDOWS\System32\stdvcl40.dll)
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
  ListServMajorVersion = 1;
  ListServMinorVersion = 0;

  LIBID_ListServ: TGUID = '{3BDFE8EA-CA1A-4918-8643-8F8D5EE2371E}';

  IID_IListServer: TGUID = '{DD9E3D16-E878-4ECC-9F1D-CDEE4B2C3B02}';
  CLASS_CoListServ: TGUID = '{4D54A7F2-9D93-469A-BEB9-F8C8F25F3408}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IListServer = interface;
  IListServerDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  CoListServ = IListServer;


// *********************************************************************//
// Interface: IListServer
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {DD9E3D16-E878-4ECC-9F1D-CDEE4B2C3B02}
// *********************************************************************//
  IListServer = interface(IDispatch)
    ['{DD9E3D16-E878-4ECC-9F1D-CDEE4B2C3B02}']
    function Get_Items: IStrings; safecall;
    procedure Set_Items(const Value: IStrings); safecall;
    function Get_Font: IFontDisp; safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    property Items: IStrings read Get_Items write Set_Items;
    property Font: IFontDisp read Get_Font write Set_Font;
  end;

// *********************************************************************//
// DispIntf:  IListServerDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {DD9E3D16-E878-4ECC-9F1D-CDEE4B2C3B02}
// *********************************************************************//
  IListServerDisp = dispinterface
    ['{DD9E3D16-E878-4ECC-9F1D-CDEE4B2C3B02}']
    property Items: IStrings dispid 1;
    property Font: IFontDisp dispid 2;
  end;

// *********************************************************************//
// The Class CoCoListServ provides a Create and CreateRemote method to          
// create instances of the default interface IListServer exposed by              
// the CoClass CoListServ. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoCoListServ = class
    class function Create: IListServer;
    class function CreateRemote(const MachineName: string): IListServer;
  end;

implementation

uses ComObj;

class function CoCoListServ.Create: IListServer;
begin
  Result := CreateComObject(CLASS_CoListServ) as IListServer;
end;

class function CoCoListServ.CreateRemote(const MachineName: string): IListServer;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_CoListServ) as IListServer;
end;

end.
