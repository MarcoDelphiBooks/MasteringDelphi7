object WebDataModule1: TWebDataModule1
  OldCreateOrder = False
  Left = 500
  Top = 109
  Height = 283
  Width = 235
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'DataSetProvider1'
    AfterPost = ClientDataSet1AfterPost
    AfterDelete = ClientDataSet1AfterDelete
    Left = 64
    Top = 32
  end
  object SQLConnection1: TSQLConnection
    ConnectionName = 'IBConnection'
    DriverName = 'Interbase'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpint.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Interbase'
      
        'Database=C:\Program Files\Common Files\Borland Shared\Data\emplo' +
        'yee.gdb'
      'RoleName=RoleName'
      'User_Name=sysdba'
      'Password=masterkey'
      'ServerCharSet='
      'SQLDialect=1'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'Interbase TransIsolation=ReadCommited'
      'Trim Char=False')
    VendorLib = 'gds32.dll'
    Left = 64
    Top = 168
  end
  object SQLDataSet1: TSQLDataSet
    CommandText = 
      'select CUST_NO, CUSTOMER, ADDRESS_LINE1, CITY, STATE_PROVINCE, C' +
      'OUNTRY from CUSTOMER'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 64
    Top = 120
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = SQLDataSet1
    Left = 64
    Top = 80
  end
end
