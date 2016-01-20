object countries: Tcountries
  OldCreateOrder = False
  PageProducer = PageProducer
  OnBeforeDispatchPage = WebPageModuleBeforeDispatchPage
  Left = 254
  Top = 107
  Height = 185
  Width = 330
  object DataSetTableProducer1: TDataSetTableProducer
    DataSet = cdsCountry
    TableAttributes.Border = 1
    TableAttributes.CellSpacing = 0
    TableAttributes.CellPadding = 3
    Left = 48
    Top = 24
  end
  object PageProducer: TPageProducer
    OnHTMLTag = PageProducerHTMLTag
    ScriptEngine = 'JScript'
    Left = 56
    Top = 88
  end
  object cdsCountry: TClientDataSet
    Aggregates = <>
    FileName = 'C:\Program Files\Common Files\Borland Shared\Data\country.cds'
    Params = <>
    Left = 152
    Top = 24
  end
end
