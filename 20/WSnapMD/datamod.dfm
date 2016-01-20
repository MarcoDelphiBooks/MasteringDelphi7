object WDataMod: TWDataMod
  OldCreateOrder = False
  OnCreate = WebDataModuleCreate
  Left = 628
  Top = 325
  Height = 331
  Width = 335
  object dsaDepartment: TDataSetAdapter
    DataSet = cdsDepartment
    Left = 40
    Top = 176
    object TAdapterDefaultActions
      object ActionDeleteRow: TDataSetAdapterDeleteRowAction
      end
      object ActionFirstRow: TDataSetAdapterFirstRowAction
      end
      object ActionPrevRow: TDataSetAdapterPrevRowAction
      end
      object ActionNextRow: TDataSetAdapterNextRowAction
      end
      object ActionLastRow: TDataSetAdapterLastRowAction
      end
      object ActionEditRow: TDataSetAdapterEditRowAction
      end
      object ActionBrowseRow: TDataSetAdapterBrowseRowAction
      end
      object ActionNewRow: TDataSetAdapterNewRowAction
      end
      object ActionCancel: TDataSetAdapterCancelRowAction
      end
      object ActionApply: TDataSetAdapterApplyRowAction
      end
      object ActionRefreshRow: TDataSetAdapterRefreshRowAction
      end
    end
    object TAdapterDefaultFields
      object AdaptDEPARTMENT: TDataSetAdapterField
        DataSetField = 'DEPARTMENT'
      end
      object AdaptDEPT_NO2: TDataSetAdapterField
        DataSetField = 'DEPT_NO'
      end
      object AdaptHEAD_DEPT: TDataSetAdapterField
        DataSetField = 'HEAD_DEPT'
      end
      object AdaptLOCATION: TDataSetAdapterField
        DataSetField = 'LOCATION'
      end
      object AdaptBUDGET: TDataSetAdapterField
        DataSetField = 'BUDGET'
      end
    end
  end
  object dsaEmployee: TDataSetAdapter
    DataSet = cdsEmployee
    MasterAdapter = dsaDepartment
    Left = 136
    Top = 176
    object TAdapterDefaultActions
    end
    object TAdapterDefaultFields
      object AdaptEMP_NO: TDataSetAdapterField
        DataSetField = 'EMP_NO'
      end
      object AdaptFIRST_NAME: TDataSetAdapterField
        DataSetField = 'FIRST_NAME'
      end
      object AdaptLAST_NAME: TDataSetAdapterField
        DataSetField = 'LAST_NAME'
      end
      object AdaptDEPT_NO: TDataSetAdapterField
        DataSetField = 'DEPT_NO'
      end
      object AdaptJOB_CODE: TDataSetAdapterField
        DataSetField = 'JOB_CODE'
      end
      object AdaptJOB_COUNTRY: TDataSetAdapterField
        DataSetField = 'JOB_COUNTRY'
      end
      object AdaptSALARY: TDataSetAdapterField
        DataSetField = 'SALARY'
      end
    end
  end
  object ibConnection: TSQLConnection
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
    Left = 224
    Top = 24
  end
  object dsDepartment: TDataSource
    DataSet = cdsDepartment
    Left = 40
    Top = 240
  end
  object cdsDepartment: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'provDepartment'
    Left = 40
    Top = 120
  end
  object cdsEmployee: TClientDataSet
    Active = True
    Aggregates = <>
    IndexFieldNames = 'DEPT_NO'
    MasterFields = 'DEPT_NO'
    MasterSource = dsDepartment
    PacketRecords = 0
    Params = <>
    ProviderName = 'provEmployee'
    Left = 136
    Top = 128
  end
  object provDepartment: TDataSetProvider
    DataSet = dataDepartment
    Left = 40
    Top = 72
  end
  object provEmployee: TDataSetProvider
    DataSet = dataEmployee
    Left = 136
    Top = 72
  end
  object dataDepartment: TSQLDataSet
    CommandText = 'select * from DEPARTMENT'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = ibConnection
    Left = 40
    Top = 24
  end
  object dataEmployee: TSQLDataSet
    CommandText = 
      'select EMP_NO, FIRST_NAME, LAST_NAME, PHONE_EXT, HIRE_DATE, JOB_' +
      'COUNTRY, DEPT_NO from EMPLOYEE'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'DEPT_NO'
        ParamType = ptInput
        Value = '000'
      end>
    SQLConnection = ibConnection
    Left = 136
    Top = 24
  end
end
