{* A sample ModelMaker unit }
unit MMDemoClasses;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs;

type
  {* This is a demo class built entirely with ModelMaker  }
  TMMDemo = class (TObject)
  private
    FText: string;
    FValue: Integer;
    function GetText: string;
    procedure SetText(const NewValue: string);
  public
    {* A simple test method with a string parameter }
    procedure Test(s: string); virtual;
    {* The amount represented by the object }
    property Value: Integer read FValue write FValue;
  published
    {* Textual description of the message displayed by the object }
    property Text: string read GetText write SetText;
  end;
  

implementation

{-**********************************************************************
******************   Class: TMMDemo
************************************************************************}
 
 
{*** TMMDemo.GetText (private)
 *** GetText is the read access method of the Text property. }
   
function TMMDemo.GetText: string;
begin
  Result := FText;
end;{ TMMDemo.GetText }

{*** TMMDemo.SetText (private)
 *** SetText is the write access method of the Text property. }
   
procedure TMMDemo.SetText(const NewValue: string);
{* Some text for the class }
begin
  if FText <> NewValue then
  begin
    FText := NewValue;
  end;
end;{ TMMDemo.SetText }

{*** TMMDemo.Test (public)
 *** This is a total nonsense, as we should at least use the values 
     of the other properties, but I felt lazy... }
   
procedure TMMDemo.Test(s: string);
{* A simple test method with a string parameter }
begin
  ShowMessage (s);
end;{ TMMDemo.Test }


end.
