unit AppServ1_TLB;

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
// File generated on 9/25/2002 4:45:02 PM from Type Library described below.

// ************************************************************************  //
// Type Lib: e:\books\md7code\16\AppServ1\AppServ1.tlb (1)
// LIBID: {09E11D60-4A55-11D3-B9F1-00000100A27B}
// LCID: 0
// Helpfile: 
// HelpString: Project1 Library
// DepndLst: 
//   (1) v1.0 Midas, (C:\WINDOWS\System32\midas.dll)
//   (2) v2.0 stdole, (C:\WINDOWS\System32\stdole2.tlb)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, Midas, StdVCL, Variants;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  AppServ1MajorVersion = 1;
  AppServ1MinorVersion = 0;

  LIBID_AppServ1: TGUID = '{09E11D60-4A55-11D3-B9F1-00000100A27B}';

  IID_IAppServerOne: TGUID = '{09E11D61-4A55-11D3-B9F1-00000100A27B}';
  CLASS_AppServerOne: TGUID = '{09E11D63-4A55-11D3-B9F1-00000100A27B}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IAppServerOne = interface;
  IAppServerOneDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  AppServerOne = IAppServerOne;


// *********************************************************************//
// Interface: IAppServerOne
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {09E11D61-4A55-11D3-B9F1-00000100A27B}
// *********************************************************************//
  IAppServerOne = interface(IAppServer)
    ['{09E11D61-4A55-11D3-B9F1-00000100A27B}']
  end;

// *********************************************************************//
// DispIntf:  IAppServerOneDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {09E11D61-4A55-11D3-B9F1-00000100A27B}
// *********************************************************************//
  IAppServerOneDisp = dispinterface
    ['{09E11D61-4A55-11D3-B9F1-00000100A27B}']
    function AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant; MaxErrors: Integer; 
                             out ErrorCount: Integer; var OwnerData: OleVariant): OleVariant; dispid 20000000;
    function AS_GetRecords(const ProviderName: WideString; Count: Integer; out RecsOut: Integer; 
                           Options: Integer; const CommandText: WideString; var Params: OleVariant; 
                           var OwnerData: OleVariant): OleVariant; dispid 20000001;
    function AS_DataRequest(const ProviderName: WideString; Data: OleVariant): OleVariant; dispid 20000002;
    function AS_GetProviderNames: OleVariant; dispid 20000003;
    function AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant; dispid 20000004;
    function AS_RowRequest(const ProviderName: WideString; Row: OleVariant; RequestType: Integer; 
                           var OwnerData: OleVariant): OleVariant; dispid 20000005;
    procedure AS_Execute(const ProviderName: WideString; const CommandText: WideString; 
                         var Params: OleVariant; var OwnerData: OleVariant); dispid 20000006;
  end;

// *********************************************************************//
// The Class CoAppServerOne provides a Create and CreateRemote method to          
// create instances of the default interface IAppServerOne exposed by              
// the CoClass AppServerOne. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoAppServerOne = class
    class function Create: IAppServerOne;
    class function CreateRemote(const MachineName: string): IAppServerOne;
  end;

implementation

uses ComObj;

class function CoAppServerOne.Create: IAppServerOne;
begin
  Result := CreateComObject(CLASS_AppServerOne) as IAppServerOne;
end;

class function CoAppServerOne.CreateRemote(const MachineName: string): IAppServerOne;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AppServerOne) as IAppServerOne;
end;

end.
