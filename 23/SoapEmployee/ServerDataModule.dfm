object DataModule3: TDataModule3
  OldCreateOrder = False
  Left = 424
  Top = 307
  Height = 175
  Width = 341
  object SQLConnection: TSQLConnection
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
    Left = 40
    Top = 24
  end
  object dsEmplList: TSQLDataSet
    CommandText = 'select EMP_NO, LAST_NAME, FIRST_NAME from EMPLOYEE'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 128
    Top = 24
    object dsEmplListEMP_NO: TSmallintField
      FieldName = 'EMP_NO'
      Required = True
    end
    object dsEmplListLAST_NAME: TStringField
      FieldName = 'LAST_NAME'
      Required = True
    end
    object dsEmplListFIRST_NAME: TStringField
      FieldName = 'FIRST_NAME'
      Required = True
      Size = 15
    end
  end
  object dsEmpData: TSQLDataSet
    CommandText = 'select * from EMPLOYEE'#13#10'where Emp_No = :id'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftSmallint
        Name = 'id'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection
    Left = 128
    Top = 72
  end
end
