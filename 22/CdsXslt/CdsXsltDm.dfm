object WebModule1: TWebModule1
  OldCreateOrder = False
  Actions = <
    item
      Default = True
      Name = 'WebActionItem1'
      PathInfo = '/show'
      OnAction = WebModule1WebActionItem1Action
    end>
  Left = 215
  Top = 118
  Height = 236
  Width = 403
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 184
    Top = 48
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = Table1
    Left = 112
    Top = 48
  end
  object Table1: TTable
    DatabaseName = 'DBDEMOS'
    TableName = 'customer.db'
    Left = 56
    Top = 48
  end
  object XMLDom: TXMLDocument
    Left = 104
    Top = 120
    DOMVendorDesc = 'MSXML'
  end
  object XSLDom: TXMLDocument
    Left = 176
    Top = 120
    DOMVendorDesc = 'MSXML'
  end
  object HTMLDom: TXMLDocument
    Left = 248
    Top = 120
    DOMVendorDesc = 'MSXML'
  end
end
