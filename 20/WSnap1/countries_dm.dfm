object countries: Tcountries
  OldCreateOrder = False
  PageProducer = PageProducer
  OnBeforeDispatchPage = WebPageModuleBeforeDispatchPage
  Left = 254
  Top = 107
  Height = 185
  Width = 224
  object DataSetTableProducer1: TDataSetTableProducer
    DataSet = Table1
    TableAttributes.Border = 1
    TableAttributes.CellSpacing = 0
    TableAttributes.CellPadding = 3
    Left = 48
    Top = 24
  end
  object Table1: TTable
    DatabaseName = 'DBDEMOS'
    SessionName = 'Session1_3'
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
  object PageProducer: TPageProducer
    OnHTMLTag = PageProducerHTMLTag
    ScriptEngine = 'JScript'
    Left = 56
    Top = 88
  end
end
