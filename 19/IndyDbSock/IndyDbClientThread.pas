unit IndyDbClientThread;

interface

uses
  Classes, IdTcpClient, DB;

type
  TLogEvent = procedure(Sender: TObject; LogMsg: String) of object;

  TSendThread = class(TThread)
  private
    fIdTcpClient: TIdTcpClient;
    fDataSet: TDataSet;
    fOnLog: TLogEvent;
    fLogMsg: String;
    fServerAddress: string;
    procedure SetOnLog(const Value: TLogEvent);
    procedure SetServerAddress(const Value: string);
  protected
    procedure Execute; override;
    procedure DoLog;
  public
    constructor Create(aDataSet: TDataSet);
    property OnLog: TLogEvent read FOnLog write SetOnLog;
    property ServerAddress: string read FServerAddress write SetServerAddress;
  end;

implementation

constructor TSendThread.Create(aDataSet: TDataSet);
begin
  inherited Create(True);
  fDataSet := aDataSet;
  FreeOnTerminate := True;
end;

procedure TSendThread.DoLog;
begin
  if Assigned(FOnLog) then
    FOnLog(self, FLogMsg);
end;

procedure TSendThread.Execute;
var
  I: Integer;
  Data: TStringList;
  Buf: String;
begin
  try
    Data := TStringList.Create;
    fIdTcpClient := TIdTcpClient.Create (nil);
    try
      fIdTcpClient.Host := ServerAddress;
      fIdTcpClient.Port := 1051;
      fIdTcpClient.Connect;
      fDataSet.First;
      while not fDataSet.Eof do
      begin
        // if the record is still not logged
        if fDataSet.FieldByName('CompID').IsNull or (fDataSet.FieldByName('CompID').AsInteger = 0) then
        begin
          FLogMsg := 'Sending ' + fDataSet.FieldByName('Company').AsString;
          Synchronize(DoLog);
          Data.Clear;
          // create strings with structure "FieldName=Value"
          for I := 0 to fDataSet.FieldCount - 1 do
            Data.Values [fDataSet.Fields[I].FieldName] :=
              fDataSet.Fields [I].AsString;
          // send the record
          fIdTcpClient.Writeln ('senddata');
          fIdTcpClient.WriteStrings (Data, True);
          // wait for reponse
          Buf := fIdTcpClient.ReadLn;
          fDataSet.Edit;
          fDataSet.FieldByName('CompID').AsString := Buf;
          fDataSet.Post;
          FLogMsg := fDataSet.FieldByName('Company').AsString +
            ' logged as ' + fDataSet.FieldByName('CompID').AsString;
          Synchronize(DoLog);
        end;
        fDataSet.Next;
      end;
    finally
      fIdTcpClient.Disconnect;
      fIdTcpClient.Free;
      Data.Free;
    end;
  except
    // trap exceptions in case of dataset errors
    // (concurrent editing and so o
  end;
end;

procedure TSendThread.SetOnLog(const Value: TLogEvent);
begin
  FOnLog := Value;
end;

procedure TSendThread.SetServerAddress(const Value: string);
begin
  FServerAddress := Value;
end;

end.
