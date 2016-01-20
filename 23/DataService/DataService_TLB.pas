unit DataService_TLB;

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
// File generated on 10/28/2002 5:20:50 PM from Type Library described below.

// ************************************************************************  //
// Type Lib: E:\books\md7code\23\DataService\DataService.tlb (1)
// LIBID: {DAEA8F54-7BDA-4B0E-BA66-A589A545CABE}
// LCID: 0
// Helpfile: 
// HelpString: DataService Library
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
  DataServiceMajorVersion = 1;
  DataServiceMinorVersion = 0;

  LIBID_DataService: TGUID = '{DAEA8F54-7BDA-4B0E-BA66-A589A545CABE}';

  IID_IDataServiceObj: TGUID = '{3AB54780-6B56-4D31-8F29-86F69B013FFD}';
  CLASS_DataServiceObj: TGUID = '{8CB4BA13-F15B-4659-972C-46B4E0195AB0}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IDataServiceObj = interface;
  IDataServiceObjDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  DataServiceObj = IDataServiceObj;


// *********************************************************************//
// Interface: IDataServiceObj
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {3AB54780-6B56-4D31-8F29-86F69B013FFD}
// *********************************************************************//
  IDataServiceObj = interface(IAppServer)
    ['{3AB54780-6B56-4D31-8F29-86F69B013FFD}']
  end;

// *********************************************************************//
// DispIntf:  IDataServiceObjDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {3AB54780-6B56-4D31-8F29-86F69B013FFD}
// *********************************************************************//
  IDataServiceObjDisp = dispinterface
    ['{3AB54780-6B56-4D31-8F29-86F69B013FFD}']
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
// The Class CoDataServiceObj provides a Create and CreateRemote method to          
// create instances of the default interface IDataServiceObj exposed by              
// the CoClass DataServiceObj. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoDataServiceObj = class
    class function Create: IDataServiceObj;
    class function CreateRemote(const MachineName: string): IDataServiceObj;
  end;

implementation

uses ComObj;

class function CoDataServiceObj.Create: IDataServiceObj;
begin
  Result := CreateComObject(CLASS_DataServiceObj) as IDataServiceObj;
end;

class function CoDataServiceObj.CreateRemote(const MachineName: string): IDataServiceObj;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DataServiceObj) as IDataServiceObj;
end;

end.
