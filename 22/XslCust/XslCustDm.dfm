object customers: Tcustomers
  OldCreateOrder = False
  PageProducer = XSLPageProducer
  AppServices = WebAppComponents
  Left = 260
  Top = 113
  Height = 296
  Width = 233
  object XSLPageProducer: TXSLPageProducer
    Active = True
    XMLData = XMLBroker1
    Left = 48
    Top = 8
    DOMVendorDesc = 'MSXML'
  end
  object WebAppComponents: TWebAppComponents
    PageDispatcher = PageDispatcher
    AdapterDispatcher = AdapterDispatcher
    ApplicationAdapter = ApplicationAdapter
    Left = 48
    Top = 56
  end
  object ApplicationAdapter: TApplicationAdapter
    Left = 48
    Top = 104
    object TAdapterDefaultActions
    end
    object TAdapterDefaultFields
    end
  end
  object PageDispatcher: TPageDispatcher
    Left = 48
    Top = 152
  end
  object AdapterDispatcher: TAdapterDispatcher
    Left = 48
    Top = 200
  end
  object XMLBroker1: TXMLBroker
    Params = <>
    ProviderName = 'DataSetProvider1'
    WebDispatch.PathInfo = 'XMLBroker1'
    Left = 144
    Top = 80
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = ClientDataSet1
    Left = 144
    Top = 136
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    FileName = 'C:\Program Files\Common Files\Borland Shared\Data\customer.cds'
    Params = <>
    Left = 144
    Top = 200
  end
end
