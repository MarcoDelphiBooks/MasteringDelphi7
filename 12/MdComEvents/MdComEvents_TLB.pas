unit MdComEvents_TLB;

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
// File generated on 10/8/2002 4:55:21 PM from Type Library described below.

// ************************************************************************  //
// Type Lib: E:\books\md7code\12\MdComEvents\MdComEvents.dll (1)
// LIBID: {F4A80A55-914B-49EF-93B1-B42EE5E37711}
// LCID: 0
// Helpfile: 
// HelpString: MdComEvents Library
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINDOWS\System32\stdole2.tlb)
// Parent TypeLibrary:
//   (0) v1.0 EvtSubscriber, (E:\books\md7code\12\MdComEvents\EvtSubscriber.tlb)
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
  MdComEventsMajorVersion = 1;
  MdComEventsMinorVersion = 0;

  LIBID_MdComEvents: TGUID = '{F4A80A55-914B-49EF-93B1-B42EE5E37711}';

  IID_IMdInform: TGUID = '{202D2CC8-8E6C-4E96-9C14-1FAAE3920ECC}';
  CLASS_MdInform: TGUID = '{0C7A44A5-CC67-4B97-9051-BFE92328EB6B}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IMdInform = interface;
  IMdInformDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  MdInform = IMdInform;


// *********************************************************************//
// Interface: IMdInform
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {202D2CC8-8E6C-4E96-9C14-1FAAE3920ECC}
// *********************************************************************//
  IMdInform = interface(IDispatch)
    ['{202D2CC8-8E6C-4E96-9C14-1FAAE3920ECC}']
    procedure Informs(Code: Integer; const Message: WideString); safecall;
  end;

// *********************************************************************//
// DispIntf:  IMdInformDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {202D2CC8-8E6C-4E96-9C14-1FAAE3920ECC}
// *********************************************************************//
  IMdInformDisp = dispinterface
    ['{202D2CC8-8E6C-4E96-9C14-1FAAE3920ECC}']
    procedure Informs(Code: Integer; const Message: WideString); dispid 1;
  end;

// *********************************************************************//
// The Class CoMdInform provides a Create and CreateRemote method to          
// create instances of the default interface IMdInform exposed by              
// the CoClass MdInform. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoMdInform = class
    class function Create: IMdInform;
    class function CreateRemote(const MachineName: string): IMdInform;
  end;

implementation

uses ComObj;

class function CoMdInform.Create: IMdInform;
begin
  Result := CreateComObject(CLASS_MdInform) as IMdInform;
end;

class function CoMdInform.CreateRemote(const MachineName: string): IMdInform;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_MdInform) as IMdInform;
end;

end.
