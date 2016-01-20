object country: Tcountry
  OldCreateOrder = False
  PageProducer = DataSetPageProducer
  OnBeforeDispatchPage = WebPageModuleBeforeDispatchPage
  Left = 397
  Top = 127
  Height = 186
  Width = 265
  object DataSetPageProducer: TDataSetPageProducer
    DataSet = Table1
    ScriptEngine = 'JScript'
    Left = 48
    Top = 16
  end
  object Table1: TTable
    DatabaseName = 'DBDEMOS'
    SessionName = 'Session1_2'
    TableName = 'country.db'
    Left = 128
    Top = 16
  end
  object Session1: TSession
    Active = True
    AutoSessionName = True
    Left = 128
    Top = 80
  end
end
