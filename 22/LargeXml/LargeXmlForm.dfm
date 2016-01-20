object Form1: TForm1
  Left = 187
  Top = 143
  Width = 628
  Height = 404
  Caption = 'LargeXml'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 160
    Width = 21
    Height = 13
    Caption = 'Log:'
  end
  object Bevel1: TBevel
    Left = 224
    Top = 16
    Width = 177
    Height = 137
  end
  object Bevel2: TBevel
    Left = 408
    Top = 16
    Width = 193
    Height = 137
  end
  object btnSaveXmlPacket: TButton
    Left = 240
    Top = 32
    Width = 145
    Height = 25
    Caption = 'Save Xml Data Packet'
    TabOrder = 0
    OnClick = btnSaveXmlPacketClick
  end
  object btnTransform: TButton
    Left = 240
    Top = 72
    Width = 145
    Height = 25
    Caption = 'Save Transformed Xml'
    TabOrder = 1
    OnClick = btnTransformClick
  end
  object memoLog: TMemo
    Left = 16
    Top = 176
    Width = 217
    Height = 177
    TabOrder = 2
  end
  object btnSaveCustom: TButton
    Left = 240
    Top = 112
    Width = 145
    Height = 25
    Caption = 'Save Custom Xml'
    TabOrder = 3
    OnClick = btnSaveCustomClick
  end
  object btnReadSAXMS: TButton
    Left = 432
    Top = 24
    Width = 153
    Height = 25
    Caption = 'Read with MSXML SAX'
    TabOrder = 4
    OnClick = btnReadSAXMSClick
  end
  object DBGrid: TDBGrid
    Left = 248
    Top = 176
    Width = 353
    Height = 177
    DataSource = DataSource1
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object btnReadSaxOpen: TButton
    Left = 432
    Top = 56
    Width = 153
    Height = 25
    Caption = 'Read with OpenXml SAX'
    TabOrder = 6
    OnClick = btnReadSaxOpenClick
  end
  object btnLoadDomOpen: TButton
    Left = 432
    Top = 88
    Width = 153
    Height = 25
    Caption = 'Load in OpenXML DOM'
    TabOrder = 7
    OnClick = btnLoadDomOpenClick
  end
  object btnLoadDomMS: TButton
    Left = 432
    Top = 120
    Width = 153
    Height = 25
    Caption = 'Load in MSXML DOM'
    TabOrder = 8
    OnClick = btnLoadDomMSClick
  end
  object radioSize: TRadioGroup
    Left = 24
    Top = 56
    Width = 185
    Height = 97
    Caption = 'DataSet Size'
    ItemIndex = 0
    Items.Strings = (
      'Small'
      'Medium'
      'Large')
    TabOrder = 9
  end
  object btnCreate: TButton
    Left = 56
    Top = 16
    Width = 105
    Height = 25
    Caption = 'Create Dataset'
    TabOrder = 10
    OnClick = btnCreateClick
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 144
    Top = 208
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = ClientDataSet1
    Left = 48
    Top = 280
  end
  object XMLTransformClient1: TXMLTransformClient
    ProviderName = 'DataSetProvider1'
    TransformGetData.TransformationFile = 'ToXml.xtr'
    Left = 144
    Top = 272
  end
  object ClientDataSet2: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'AN3CHIAVE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'AN3TIPPRA'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'AN3CODICE'
        DataType = ftFloat
      end
      item
        Name = 'AN3TIPDIC'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'AN3CODFIS'
        DataType = ftString
        Size = 16
      end
      item
        Name = 'AN3COGNOM'
        DataType = ftString
        Size = 24
      end
      item
        Name = 'AN3NOME__'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'AN3SESSO_'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'AN3DATNAS'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'AN3CATNAS'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'AN3DESNAS'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'AN3PRVNAS'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'AN3FLGRES'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'AN3CATRES'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'AN3DESRES'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'AN3PRVRES'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'AN3CAPRES'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'AN3INDRES'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'AN3PREFIS'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'AN3TELEFO'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'AN3DATVAR'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'AN3FLGVAR'
        DataType = ftSmallint
      end
      item
        Name = 'AN3CATR31'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'AN3DESR31'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'AN3PRVR31'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'AN3REGI31'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'AN3ETA_31'
        DataType = ftSmallint
      end
      item
        Name = 'AN3REGMSG'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'AN3STACIV'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'AN3CFSOSA'
        DataType = ftString
        Size = 16
      end
      item
        Name = 'AN3CFSOS4'
        DataType = ftString
        Size = 16
      end
      item
        Name = 'AN3PRSOS4'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'AN3UFSOS4'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'AN3CATSIN'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'AN3QUALIF'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'AN3TESSER'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'AN3SEDINP'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'AN3DICINP'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'AN3STADIC'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'AN3STA_B4'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'AN3ISCRIT'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'AN3PRIVACY'
        DataType = ftSmallint
      end
      item
        Name = 'GENCODTRA'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'GENSERVER'
        DataType = ftString
        Size = 30
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 472
    Top = 224
  end
  object DataSource1: TDataSource
    Left = 392
    Top = 224
  end
  object XMLDocument1: TXMLDocument
    Left = 296
    Top = 224
    DOMVendorDesc = 'Open XML'
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
    Connection.VendorLib = 'gds32.dll'
    DataSet.CommandText = 'select * from employee'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 48
    Top = 208
  end
  object XMLDocument2: TXMLDocument
    Left = 296
    Top = 280
    DOMVendorDesc = 'MSXML'
  end
end
