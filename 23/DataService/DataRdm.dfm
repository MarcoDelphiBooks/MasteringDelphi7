object DataServiceObj: TDataServiceObj
  OldCreateOrder = False
  Left = 510
  Top = 133
  Height = 150
  Width = 215
  object Table1: TTable
    DatabaseName = 'DBDEMOS'
    TableName = 'customer.db'
    Left = 48
    Top = 48
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = Table1
    Constraints = True
    Left = 104
    Top = 56
  end
end
