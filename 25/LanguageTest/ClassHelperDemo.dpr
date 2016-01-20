Program classhelperdemo;

{$APPTYPE CONSOLE}

uses
  Borland.Delphi.SysUtils;

type
  TMyObject = class
  private
    Value: Integer;
    Text: string;
  public
    procedure Increase;
  end;

  TMyObjectHelper = class helper for TMyObject
  public
    procedure Show;
  end;

  TMyNewObject = class (TMyObject)
  private
    Value2: Integer;
  public
    procedure Show2;
    procedure Increase2;
 end;

{ TMyObject }

procedure TMyObject.Increase;
begin
  Inc (Value);
end;

{ TMyObjectHelper }

procedure TMyObjectHelper.Show;
begin
  WriteLn (Text + ' ' + IntToStr (Value) + ' -- ' +
    self.ClassType.ClassName + ' -- ' + ToString);
end;

procedure TMyNewObject.Show2;
begin
  WriteLn (Text + ' ' + IntToStr (Value) + ' -- ' +
    self.ClassType.ClassName + ' -- ' + ToString);
end;


var
  Obj: TMyObject;

{ TMyNewObject }

procedure TMyNewObject.Increase2;
begin
  Inc (value2);
end;

begin
  Obj := TMyObject.Create;
  Obj.Text := 'foo';
  // Obj.Increase2;
  Obj.Show;
  // Obj.Show2;

end.
