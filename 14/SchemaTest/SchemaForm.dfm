object FormSchema: TFormSchema
  Left = 196
  Top = 107
  Width = 643
  Height = 414
  Caption = 'SchemaTest'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    635
    387)
  PixelsPerInch = 96
  TextHeight = 13
  object btnTables: TButton
    Left = 30
    Top = 13
    Width = 65
    Height = 22
    Caption = 'Tables'
    TabOrder = 0
    OnClick = btnTablesClick
  end
  object btnFields: TButton
    Left = 105
    Top = 13
    Width = 64
    Height = 22
    Caption = 'Fields'
    TabOrder = 1
    OnClick = btnFieldsClick
  end
  object DBGrid1: TDBGrid
    Left = 32
    Top = 48
    Width = 580
    Height = 313
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataSource1
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 200
    Top = 72
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
    Left = 72
    Top = 168
  end
  object SQLDataSet1: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 184
    Top = 168
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 312
    Top = 80
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = SQLDataSet1
    Left = 272
    Top = 136
  end
end
