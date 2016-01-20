object DmCds: TDmCds
  OldCreateOrder = False
  Left = 257
  Top = 194
  Height = 182
  Width = 510
  object cdsEmployee: TClientDataSet
    Aggregates = <>
    PacketRecords = 5
    Params = <>
    ProviderName = 'EmplProvider'
    OnCalcFields = CalcStatusField
    OnReconcileError = cdsEmployeeReconcileError
    Left = 64
    Top = 88
    object cdsEmployeeStatus: TStringField
      FieldKind = fkCalculated
      FieldName = 'Status'
      Calculated = True
    end
    object cdsEmployeeDEPT_NO: TStringField
      FieldName = 'DEPT_NO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsEmployeeEMP_NO: TSmallintField
      FieldName = 'EMP_NO'
      Required = True
    end
    object cdsEmployeeFIRST_NAME: TStringField
      FieldName = 'FIRST_NAME'
      Required = True
      Size = 15
    end
    object cdsEmployeeLAST_NAME: TStringField
      FieldName = 'LAST_NAME'
      Required = True
    end
    object cdsEmployeePHONE_EXT: TStringField
      FieldName = 'PHONE_EXT'
      Size = 4
    end
    object cdsEmployeeSALARY: TFMTBCDField
      FieldName = 'SALARY'
      Required = True
      Precision = 15
      Size = 2
    end
  end
  object cdsDelta: TClientDataSet
    Aggregates = <>
    Params = <>
    ReadOnly = True
    OnCalcFields = CalcStatusField
    Left = 166
    Top = 87
    object cdsDeltaStatus: TStringField
      FieldKind = fkCalculated
      FieldName = 'Status'
      Calculated = True
    end
    object cdsDeltaDEPT_NO: TStringField
      FieldName = 'DEPT_NO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsDeltaEMP_NO: TSmallintField
      FieldName = 'EMP_NO'
      Required = True
    end
    object cdsDeltaFIRST_NAME: TStringField
      FieldName = 'FIRST_NAME'
      Required = True
      Size = 15
    end
    object cdsDeltaLAST_NAME: TStringField
      FieldName = 'LAST_NAME'
      Required = True
    end
    object cdsDeltaPHONE_EXT: TStringField
      FieldName = 'PHONE_EXT'
      Size = 4
    end
    object cdsDeltaSALARY: TFMTBCDField
      FieldName = 'SALARY'
      Required = True
      Precision = 15
      Size = 2
    end
  end
  object SQLConnection: TSQLConnection
    ConnectionName = 'IBLocal'
    DriverName = 'Interbase'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpint.dll'
    LoginPrompt = False
    Params.Strings = (
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
    VendorLib = 'GDS32.DLL'
    Connected = True
    Left = 32
    Top = 16
  end
  object EmplData: TSQLDataSet
    CommandText = 
      'select DEPT_NO, EMP_NO, FIRST_NAME, LAST_NAME, SALARY, PHONE_EXT' +
      ' from EMPLOYEE'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 112
    Top = 16
  end
  object EmplProvider: TDataSetProvider
    DataSet = EmplData
    Left = 192
    Top = 16
  end
end
