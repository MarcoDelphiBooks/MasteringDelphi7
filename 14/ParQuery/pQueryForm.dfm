object Form1: TForm1
  Left = 217
  Top = 188
  Width = 605
  Height = 392
  VertScrollBar.Range = 36
  AutoScroll = False
  Caption = 'ParQuery'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 597
    Height = 36
    Align = alTop
    TabOrder = 0
    object ComboBox1: TComboBox
      Left = 21
      Top = 7
      Width = 121
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      Text = 'ComboBox1'
    end
    object Button1: TButton
      Left = 153
      Top = 7
      Width = 63
      Height = 22
      Caption = 'Select'
      TabOrder = 1
      OnClick = Button1Click
    end
    object DBNavigator1: TDBNavigator
      Left = 250
      Top = 7
      Width = 200
      Height = 23
      DataSource = DataSource1
      TabOrder = 2
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 36
    Width = 597
    Height = 329
    Align = alClient
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
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
    Left = 56
    Top = 56
  end
  object SQLDataSet1: TSQLDataSet
    CommandText = 'select * from EMPLOYEE'#13#10'where job_country = :country'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'country'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 56
    Top = 120
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 56
    Top = 240
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = SQLDataSet1
    Left = 56
    Top = 184
  end
  object SQLDataSet2: TSQLDataSet
    CommandText = 'select distinct(job_country) from EMPLOYEE'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 64
    Top = 304
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 128
    Top = 56
  end
end
