unit EvtSubscriber_TLB;

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
// Type Lib: E:\books\md7code\12\MdComEvents\EvtSubscriber.tlb (1)
// LIBID: {CC4759F2-5BFD-4D5F-8B73-F251070EDADE}
// LCID: 0
// Helpfile: 
// HelpString: EvtSubscriber Library
// DepndLst: 
//   (1) v1.0 MdComEvents, (E:\books\md7code\12\MdComEvents\MdComEvents.dll)
//   (2) v2.0 stdole, (C:\WINDOWS\System32\stdole2.tlb)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, MdComEvents_TLB, StdVCL, Variants;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  EvtSubscriberMajorVersion = 1;
  EvtSubscriberMinorVersion = 0;

  LIBID_EvtSubscriber: TGUID = '{CC4759F2-5BFD-4D5F-8B73-F251070EDADE}';

  CLASS_InformSubscriber: TGUID = '{30C23917-52CC-4581-9341-81D2430B39C3}';
type

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  InformSubscriber = IMdInform;


// *********************************************************************//
// The Class CoInformSubscriber provides a Create and CreateRemote method to          
// create instances of the default interface IMdInform exposed by              
// the CoClass InformSubscriber. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoInformSubscriber = class
    class function Create: IMdInform;
    class function CreateRemote(const MachineName: string): IMdInform;
  end;

implementation

uses ComObj;

class function CoInformSubscriber.Create: IMdInform;
begin
  Result := CreateComObject(CLASS_InformSubscriber) as IMdInform;
end;

class function CoInformSubscriber.CreateRemote(const MachineName: string): IMdInform;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_InformSubscriber) as IMdInform;
end;

end.
