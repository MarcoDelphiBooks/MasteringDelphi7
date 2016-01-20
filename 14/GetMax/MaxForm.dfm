object Form1: TForm1
  Left = 202
  Top = 125
  Width = 291
  Height = 158
  HorzScrollBar.Range = 183
  VertScrollBar.Range = 84
  ActiveControl = BtnTable
  AutoScroll = False
  Caption = 'GetMax'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object BtnTable: TButton
    Left = 118
    Top = 28
    Width = 65
    Height = 21
    Caption = 'Local'
    TabOrder = 0
    OnClick = BtnTableClick
  end
  object BtnQuery: TButton
    Left = 118
    Top = 62
    Width = 65
    Height = 22
    Caption = 'Query'
    TabOrder = 1
    OnClick = BtnQueryClick
  end
  object SQLConnection1: TSQLConnection
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
    Left = 40
    Top = 16
  end
  object EmpTable: TSQLTable
    MaxBlobSize = -1
    SQLConnection = SQLConnection1
    TableName = 'EMPLOYEE'
    Left = 40
    Top = 64
  end
  object EmpQuery: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select max (salary) from employee')
    SQLConnection = SQLConnection1
    Left = 224
    Top = 16
  end
end
