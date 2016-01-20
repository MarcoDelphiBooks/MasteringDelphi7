object AppServerPlus: TAppServerPlus
  OldCreateOrder = False
  Left = 281
  Top = 200
  Height = 480
  Width = 696
  object TableCustomer: TTable
    Active = True
    DatabaseName = 'DBDEMOS'
    TableName = 'customer.db'
    Left = 136
    Top = 40
    object TableCustomerCustNo: TFloatField
      FieldName = 'CustNo'
    end
    object TableCustomerCompany: TStringField
      FieldName = 'Company'
      Size = 30
    end
    object TableCustomerAddr1: TStringField
      FieldName = 'Addr1'
      Size = 30
    end
    object TableCustomerAddr2: TStringField
      FieldName = 'Addr2'
      Size = 30
    end
    object TableCustomerCity: TStringField
      FieldName = 'City'
      Size = 15
    end
    object TableCustomerState: TStringField
      FieldName = 'State'
    end
    object TableCustomerZip: TStringField
      FieldName = 'Zip'
      Size = 10
    end
    object TableCustomerCountry: TStringField
      FieldName = 'Country'
    end
    object TableCustomerPhone: TStringField
      FieldName = 'Phone'
      Size = 15
    end
    object TableCustomerFAX: TStringField
      FieldName = 'FAX'
      Size = 15
    end
    object TableCustomerTaxRate: TFloatField
      FieldName = 'TaxRate'
    end
    object TableCustomerContact: TStringField
      FieldName = 'Contact'
    end
    object TableCustomerLastInvoiceDate: TDateTimeField
      FieldName = 'LastInvoiceDate'
    end
  end
  object Query: TQuery
    DatabaseName = 'DBDEMOS'
    SQL.Strings = (
      'select * from customer'
      '  where Country = :Country')
    Left = 112
    Top = 200
    ParamData = <
      item
        DataType = ftString
        Name = 'Country'
        ParamType = ptUnknown
        Value = ''
      end>
  end
  object TableOrders: TTable
    DatabaseName = 'DBDEMOS'
    IndexName = 'CustNo'
    MasterFields = 'CustNo'
    MasterSource = DataSourceCust
    TableName = 'ORDERS.DB'
    Left = 224
    Top = 104
  end
  object DataSourceCust: TDataSource
    DataSet = TableCustomer
    Left = 224
    Top = 40
  end
  object ProviderCustomer: TDataSetProvider
    DataSet = TableCustomer
    OnUpdateData = ProviderCustomerUpdateData
    BeforeUpdateRecord = ProviderCustomerBeforeUpdateRecord
    Left = 56
    Top = 40
  end
  object ProviderQuery: TDataSetProvider
    DataSet = Query
    OnGetDataSetProperties = ProviderQueryGetDataSetProperties
    Left = 48
    Top = 200
  end
end
