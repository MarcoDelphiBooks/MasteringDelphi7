object DataModule1: TDataModule1
  OldCreateOrder = False
  Left = 472
  Top = 220
  Height = 150
  Width = 215
  object SimpleDataSet1: TSimpleDataSet
    Aggregates = <>
    Connection.ConnectionName = 'IBLocal'
    Connection.DriverName = 'Interbase'
    Connection.GetDriverFunc = 'getSQLDriverINTERBASE'
    Connection.LibraryName = 'dbexpint.dll'
    Connection.LoginPrompt = False
    Connection.Params.Strings = (
      'BlobSize=-1'
      'CommitRetain=False'
      
        'Database=C:\Program Files\Common Files\Borland Shared\Data\emplo' +
        'yee.gdb'
      'DriverName=Interbase'
      'Password=masterkey'
      'RoleName=RoleName'
      'ServerCharSet=ASCII'
      'SQLDialect=1'
      'Interbase TransIsolation=ReadCommited'
      'User_Name=sysdba'
      'WaitOnLocks=True')
    Connection.VendorLib = 'GDS32.DLL'
    Connection.Connected = True
    DataSet.CommandText = 'select * from EMPLOYEE'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 56
    Top = 32
  end
end
