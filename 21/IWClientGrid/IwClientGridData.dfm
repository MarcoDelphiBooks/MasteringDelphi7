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
    object SimpleDataSet1EMP_NO: TSmallintField
      FieldName = 'EMP_NO'
      Required = True
    end
    object SimpleDataSet1FIRST_NAME: TStringField
      FieldName = 'FIRST_NAME'
      Required = True
      Size = 15
    end
    object SimpleDataSet1LAST_NAME: TStringField
      FieldName = 'LAST_NAME'
      Required = True
    end
    object SimpleDataSet1PHONE_EXT: TStringField
      FieldName = 'PHONE_EXT'
      Size = 4
    end
    object SimpleDataSet1DEPT_NO: TStringField
      FieldName = 'DEPT_NO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object SimpleDataSet1JOB_CODE: TStringField
      FieldName = 'JOB_CODE'
      Required = True
      Size = 5
    end
    object SimpleDataSet1JOB_GRADE: TSmallintField
      FieldName = 'JOB_GRADE'
      Required = True
    end
    object SimpleDataSet1JOB_COUNTRY: TStringField
      FieldName = 'JOB_COUNTRY'
      Required = True
      Size = 15
    end
  end
end
