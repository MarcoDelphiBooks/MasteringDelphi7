object DataModule1: TDataModule1
  OldCreateOrder = False
  OnCreate = DataModule1Create
  Left = 239
  Top = 180
  Height = 238
  Width = 406
  object dsCust: TDataSource
    DataSet = cdsCustomers
    Left = 32
    Top = 64
  end
  object dsOrd: TDataSource
    DataSet = cdsOrders
    Left = 93
    Top = 69
  end
  object cdsOrders: TClientDataSet
    Aggregates = <>
    FileName = 'C:\Program Files\Common Files\Borland Shared\data\orders.cds'
    IndexFieldNames = 'CustNo'
    MasterFields = 'CustNo'
    MasterSource = dsCust
    PacketRecords = 0
    Params = <>
    Left = 112
    Top = 136
  end
  object cdsCustomers: TClientDataSet
    Aggregates = <>
    FileName = 'C:\Program Files\Common Files\Borland Shared\data\customer.cds'
    Params = <>
    Left = 40
    Top = 136
  end
end
