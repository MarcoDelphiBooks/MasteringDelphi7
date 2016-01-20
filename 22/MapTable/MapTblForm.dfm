object Form1: TForm1
  Left = 220
  Top = 146
  Width = 613
  Height = 438
  Caption = 'MapTable'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    605
    411)
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 589
    Height = 169
    Anchors = [akLeft, akTop, akRight]
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object btnMap: TButton
    Left = 8
    Top = 184
    Width = 588
    Height = 25
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Map'
    TabOrder = 1
    OnClick = btnMapClick
  end
  object Memo1: TMemo
    Left = 8
    Top = 216
    Width = 588
    Height = 192
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = SimpleDataSet1
    Left = 64
    Top = 168
  end
  object XMLTransformClient1: TXMLTransformClient
    ProviderName = 'DataSetProvider1'
    TransformGetData.TransformationFile = 'CustomersToXml.xtr'
    Left = 64
    Top = 224
  end
  object DataSource1: TDataSource
    DataSet = SimpleDataSet1
    Left = 64
    Top = 112
  end
  object SimpleDataSet1: TSimpleDataSet
    Aggregates = <>
    Connection.ConnectionName = 'IBConnection'
    Connection.DriverName = 'Interbase'
    Connection.GetDriverFunc = 'getSQLDriverINTERBASE'
    Connection.LibraryName = 'dbexpint.dll'
    Connection.LoginPrompt = False
    Connection.Params.Strings = (
      'DriverName=Interbase'
      
        'Database=C:\Program Files\Common Files\Borland Shared\Data\masts' +
        'ql.gdb'
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
    Connection.VendorLib = 'gds32.dll'
    DataSet.CommandText = 'select * from  CUSTOMER'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 64
    Top = 56
  end
end
