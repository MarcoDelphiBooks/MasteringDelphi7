object country: Tcountry
  OldCreateOrder = False
  PageProducer = DataSetPageProducer
  OnBeforeDispatchPage = WebPageModuleBeforeDispatchPage
  Left = 397
  Top = 127
  Height = 186
  Width = 265
  object DataSetPageProducer: TDataSetPageProducer
    DataSet = cdsCountry
    ScriptEngine = 'JScript'
    Left = 48
    Top = 16
  end
  object cdsCountry: TClientDataSet
    Aggregates = <>
    FileName = 'C:\Program Files\Common Files\Borland Shared\Data\country.cds'
    Params = <>
    Left = 152
    Top = 24
  end
end
