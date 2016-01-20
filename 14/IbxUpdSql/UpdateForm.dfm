object Form1: TForm1
  Left = 195
  Top = 107
  Width = 734
  Height = 480
  Caption = 'IbxUpdSql'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 25
    Width = 726
    Height = 428
    Align = alClient
    DataSource = EmpDS
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 726
    Height = 25
    ButtonHeight = 21
    ButtonWidth = 55
    Caption = 'ToolBar1'
    ShowCaptions = True
    TabOrder = 1
    object ToolButton1: TToolButton
      Left = 0
      Top = 2
      Action = DataSetFirst1
    end
    object ToolButton2: TToolButton
      Left = 55
      Top = 2
      Action = DataSetPrior1
    end
    object ToolButton3: TToolButton
      Left = 110
      Top = 2
      Action = DataSetNext1
    end
    object ToolButton4: TToolButton
      Left = 165
      Top = 2
      Action = DataSetLast1
    end
    object ToolButton7: TToolButton
      Left = 220
      Top = 2
      Action = DataSetInsert1
    end
    object ToolButton8: TToolButton
      Left = 275
      Top = 2
      Action = DataSetDelete1
    end
    object ToolButton5: TToolButton
      Left = 330
      Top = 2
      Action = DataSetEdit1
    end
    object ToolButton6: TToolButton
      Left = 385
      Top = 2
      Action = DataSetPost1
    end
    object ToolButton10: TToolButton
      Left = 440
      Top = 2
      Action = DataSetCancel1
    end
    object ToolButton9: TToolButton
      Left = 495
      Top = 2
      Action = DataSetRefresh1
    end
    object ToolButton11: TToolButton
      Left = 550
      Top = 2
      Action = acCommit
    end
    object ToolButton12: TToolButton
      Left = 605
      Top = 2
      Action = acRollback
    end
  end
  object IBQuery1: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    SQL.Strings = (
      
        'SELECT Employee.EMP_NO, Department.DEPARTMENT, Employee.FIRST_NA' +
        'ME, Employee.LAST_NAME, Job.JOB_TITLE, Employee.SALARY, Employee' +
        '.DEPT_NO, Employee.JOB_CODE, Employee.JOB_GRADE, Employee.JOB_CO' +
        'UNTRY'
      'FROM EMPLOYEE Employee'
      '   INNER JOIN DEPARTMENT Department'
      '   ON  (Department.DEPT_NO = Employee.DEPT_NO)  '
      '   INNER JOIN JOB Job'
      '   ON  (Job.JOB_CODE = Employee.JOB_CODE)  '
      '   AND  (Job.JOB_GRADE = Employee.JOB_GRADE)  '
      '   AND  (Job.JOB_COUNTRY = Employee.JOB_COUNTRY)  '
      'ORDER BY Department.DEPARTMENT, Employee.LAST_NAME')
    UpdateObject = IBUpdateSQL1
    Left = 116
    Top = 136
  end
  object IBUpdateSQL1: TIBUpdateSQL
    RefreshSQL.Strings = (
      'SELECT Employee.EMP_NO, Employee.FIRST_NAME, Employee.LAST_NAME,'
      
        'Department.DEPARTMENT, Job.JOB_TITLE, Employee.SALARY, Employee.' +
        'DEPT_NO,'
      'Employee.JOB_CODE, Employee.JOB_GRADE, Employee.JOB_COUNTRY'
      'FROM EMPLOYEE Employee'
      'INNER JOIN DEPARTMENT Department'
      'ON (Department.DEPT_NO = Employee.DEPT_NO)'
      'INNER JOIN JOB Job'
      'ON (Job.JOB_CODE = Employee.JOB_CODE)'
      'AND (Job.JOB_GRADE = Employee.JOB_GRADE)'
      'AND (Job.JOB_COUNTRY = Employee.JOB_COUNTRY)'
      'WHERE Employee.EMP_NO=:EMP_NO'
      ''
      ''
      ''
      '')
    ModifySQL.Strings = (
      'update EMPLOYEE'
      'set'
      '  FIRST_NAME = :FIRST_NAME,'
      '  LAST_NAME = :LAST_NAME,'
      '  SALARY = :SALARY,'
      '  DEPT_NO = :DEPT_NO,'
      '  JOB_CODE = :JOB_CODE,'
      '  JOB_GRADE = :JOB_GRADE,'
      '  JOB_COUNTRY = :JOB_COUNTRY'
      'where'
      '  EMP_NO = :OLD_EMP_NO')
    InsertSQL.Strings = (
      'insert into EMPLOYEE'
      '  (FIRST_NAME, LAST_NAME, SALARY, DEPT_NO, JOB_CODE, JOB_GRADE, '
      'JOB_COUNTRY)'
      'values'
      
        '  (:FIRST_NAME, :LAST_NAME, :SALARY, :DEPT_NO, :JOB_CODE, :JOB_G' +
        'RADE, '
      ':JOB_COUNTRY)')
    DeleteSQL.Strings = (
      'delete from EMPLOYEE'
      'where'
      '  EMP_NO = :OLD_EMP_NO')
    Left = 120
    Top = 192
  end
  object EmpDS: TDataSource
    DataSet = IBDataSet1
    Left = 188
    Top = 176
  end
  object IBDatabase1: TIBDatabase
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    IdleTimer = 0
    SQLDialect = 1
    TraceFlags = [tfQPrepare, tfQExecute, tfQFetch, tfError, tfStmt, tfConnect, tfTransact, tfBlob, tfService, tfMisc]
    Left = 40
    Top = 192
  end
  object IBTransaction1: TIBTransaction
    Active = False
    DefaultDatabase = IBDatabase1
    AutoStopAction = saNone
    Left = 40
    Top = 112
  end
  object IBDataSet1: TIBDataSet
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from EMPLOYEE'
      'where'
      '  EMP_NO = :OLD_EMP_NO')
    InsertSQL.Strings = (
      'insert into EMPLOYEE'
      '  (FIRST_NAME, LAST_NAME, SALARY, DEPT_NO, JOB_CODE, JOB_GRADE, '
      'JOB_COUNTRY)'
      'values'
      
        '  (:FIRST_NAME, :LAST_NAME, :SALARY, :DEPT_NO, :JOB_CODE, :JOB_G' +
        'RADE, '
      ':JOB_COUNTRY)')
    RefreshSQL.Strings = (
      'SELECT Employee.EMP_NO, Employee.FIRST_NAME, Employee.LAST_NAME,'
      
        'Department.DEPARTMENT, Job.JOB_TITLE, Employee.SALARY, Employee.' +
        'DEPT_NO,'
      'Employee.JOB_CODE, Employee.JOB_GRADE, Employee.JOB_COUNTRY'
      'FROM EMPLOYEE Employee'
      'INNER JOIN DEPARTMENT Department'
      'ON (Department.DEPT_NO = Employee.DEPT_NO)'
      'INNER JOIN JOB Job'
      'ON (Job.JOB_CODE = Employee.JOB_CODE)'
      'AND (Job.JOB_GRADE = Employee.JOB_GRADE)'
      'AND (Job.JOB_COUNTRY = Employee.JOB_COUNTRY)'
      'WHERE Employee.EMP_NO=:EMP_NO')
    SelectSQL.Strings = (
      
        'SELECT Employee.EMP_NO, Employee.FIRST_NAME, Employee.LAST_NAME,' +
        ' Department.DEPARTMENT, Job.JOB_TITLE, Employee.SALARY, Employee' +
        '.DEPT_NO, Employee.JOB_CODE, Employee.JOB_GRADE, Employee.JOB_CO' +
        'UNTRY'
      'FROM EMPLOYEE Employee'
      '   INNER JOIN DEPARTMENT Department'
      '   ON  (Department.DEPT_NO = Employee.DEPT_NO)  '
      '   INNER JOIN JOB Job'
      '   ON  (Job.JOB_CODE = Employee.JOB_CODE)  '
      '   AND  (Job.JOB_GRADE = Employee.JOB_GRADE)  '
      '   AND  (Job.JOB_COUNTRY = Employee.JOB_COUNTRY)  '
      'ORDER BY Department.DEPARTMENT')
    ModifySQL.Strings = (
      'update EMPLOYEE'
      'set'
      '  FIRST_NAME = :FIRST_NAME,'
      '  LAST_NAME = :LAST_NAME,'
      '  SALARY = :SALARY,'
      '  DEPT_NO = :DEPT_NO,'
      '  JOB_CODE = :JOB_CODE,'
      '  JOB_GRADE = :JOB_GRADE,'
      '  JOB_COUNTRY = :JOB_COUNTRY'
      'where'
      '  EMP_NO = :OLD_EMP_NO')
    Left = 120
    Top = 256
  end
  object ActionList1: TActionList
    Left = 192
    Top = 256
    object DataSetCancel1: TDataSetCancel
      Category = 'Dataset'
      Caption = '&Cancel'
      Hint = 'Cancel'
      ImageIndex = 8
    end
    object DataSetDelete1: TDataSetDelete
      Category = 'Dataset'
      Caption = '&Delete'
      Hint = 'Delete'
      ImageIndex = 5
    end
    object DataSetEdit1: TDataSetEdit
      Category = 'Dataset'
      Caption = '&Edit'
      Hint = 'Edit'
      ImageIndex = 6
    end
    object DataSetFirst1: TDataSetFirst
      Category = 'Dataset'
      Caption = '&First'
      Hint = 'First'
      ImageIndex = 0
    end
    object DataSetInsert1: TDataSetInsert
      Category = 'Dataset'
      Caption = '&Insert'
      Hint = 'Insert'
      ImageIndex = 4
    end
    object DataSetLast1: TDataSetLast
      Category = 'Dataset'
      Caption = '&Last'
      Hint = 'Last'
      ImageIndex = 3
    end
    object DataSetNext1: TDataSetNext
      Category = 'Dataset'
      Caption = '&Next'
      Hint = 'Next'
      ImageIndex = 2
    end
    object DataSetPost1: TDataSetPost
      Category = 'Dataset'
      Caption = 'P&ost'
      Hint = 'Post'
      ImageIndex = 7
    end
    object DataSetPrior1: TDataSetPrior
      Category = 'Dataset'
      Caption = '&Prior'
      Hint = 'Prior'
      ImageIndex = 1
    end
    object DataSetRefresh1: TDataSetRefresh
      Category = 'Dataset'
      Caption = '&Refresh'
      Hint = 'Refresh'
      ImageIndex = 9
    end
    object acCommit: TAction
      Category = 'Transactions'
      Caption = '&Commit'
      OnExecute = acCommitExecute
      OnUpdate = ActionUpdateTransactions
    end
    object acRollback: TAction
      Category = 'Transactions'
      Caption = '&Rollback'
      OnExecute = acRollbackExecute
      OnUpdate = ActionUpdateTransactions
    end
  end
end
