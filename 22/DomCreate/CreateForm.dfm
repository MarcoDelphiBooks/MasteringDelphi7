object Form1: TForm1
  Left = 192
  Top = 107
  Width = 571
  Height = 412
  Caption = 'DomCreate'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 97
    Height = 385
    Align = alLeft
    TabOrder = 0
    object btnObject: TButton
      Left = 8
      Top = 72
      Width = 75
      Height = 25
      Caption = 'Object'
      TabOrder = 0
      OnClick = btnObjectClick
    end
    object btnSimple: TButton
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Simple'
      TabOrder = 1
      OnClick = btnSimpleClick
    end
    object btnTable: TButton
      Left = 8
      Top = 40
      Width = 75
      Height = 25
      Caption = 'Table'
      TabOrder = 2
      OnClick = btnTableClick
    end
    object btnTree: TButton
      Left = 8
      Top = 184
      Width = 75
      Height = 25
      Caption = 'Tree'
      TabOrder = 3
      OnClick = btnTreeClick
    end
    object Button1: TButton
      Left = 8
      Top = 216
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 4
    end
    object btnRTTI: TButton
      Left = 8
      Top = 104
      Width = 75
      Height = 25
      Caption = 'RTTI'
      TabOrder = 5
      OnClick = btnRTTIClick
    end
  end
  object Panel2: TPanel
    Left = 97
    Top = 0
    Width = 466
    Height = 385
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object Splitter1: TSplitter
      Left = 0
      Top = 185
      Width = 466
      Height = 3
      Cursor = crVSplit
      Align = alTop
    end
    object TreeView1: TTreeView
      Left = 0
      Top = 188
      Width = 466
      Height = 197
      Align = alClient
      Indent = 19
      TabOrder = 0
    end
    object Memo1: TMemo
      Left = 0
      Top = 0
      Width = 466
      Height = 185
      Align = alTop
      TabOrder = 1
    end
  end
  object XMLDoc: TXMLDocument
    Active = True
    NodeIndentStr = '    '
    Options = [doNodeAutoCreate, doNodeAutoIndent, doAttrNull, doAutoPrefix, doNamespaceDecl]
    Left = 296
    Top = 72
    DOMVendorDesc = 'MSXML'
  end
  object SQLConnection1: TSQLConnection
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
    Connected = True
    Left = 153
    Top = 72
  end
  object SQLDataSet1: TSQLDataSet
    CommandText = 'select * from CUSTOMER'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 233
    Top = 72
  end
end
