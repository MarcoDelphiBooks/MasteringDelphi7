object sampledatamodule: Tsampledatamodule
  OldCreateOrder = False
  Left = 194
  Top = 107
  Height = 212
  Width = 336
  object DataSetProvider1: TDataSetProvider
    DataSet = SQLDataSet1
    Left = 80
    Top = 24
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
    Left = 152
    Top = 24
  end
  object SQLDataSet1: TSQLDataSet
    CommandText = 'select * from EMPLOYEE'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 80
    Top = 72
  end
  object SQLDataSet2: TSQLDataSet
    CommandText = 'select count(*) from EMPLOYEE'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 152
    Top = 72
  end
end
