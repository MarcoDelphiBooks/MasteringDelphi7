object Form1: TForm1
  Left = 192
  Top = 107
  Width = 438
  Height = 408
  Caption = 'XmlMapping'
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
  object Splitter1: TSplitter
    Left = 0
    Top = 185
    Width = 430
    Height = 5
    Cursor = crVSplit
    Align = alTop
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 430
    Height = 144
    Align = alTop
    DataSource = DataSource2
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 430
    Height = 41
    Align = alTop
    TabOrder = 1
    object Label2: TLabel
      Left = 288
      Top = 16
      Width = 21
      Height = 13
      Caption = 'Text'
      FocusControl = DBEdit2
    end
    object DBNavigator1: TDBNavigator
      Left = 16
      Top = 8
      Width = 160
      Height = 25
      VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 320
      Top = 12
      Width = 69
      Height = 21
      DataField = 'text'
      DataSource = DataSource1
      TabOrder = 1
    end
    object Button1: TButton
      Left = 184
      Top = 8
      Width = 65
      Height = 25
      Caption = 'Save'
      TabOrder = 2
      OnClick = Button1Click
    end
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 190
    Width = 430
    Height = 191
    Align = alClient
    DataSource = DataSource3
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object XMLTransformProvider1: TXMLTransformProvider
    TransformRead.TransformationFile = 'BooksDefault.xtr'
    TransformWrite.TransformationFile = 'BooksDefaultToXml.xtr'
    XMLDataFile = 'Sample.xml'
    Left = 72
    Top = 24
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'XMLTransformProvider1'
    Left = 72
    Top = 80
    object ClientDataSet1text: TStringField
      FieldName = 'text'
      Size = 5
    end
    object ClientDataSet1book: TDataSetField
      FieldName = 'book'
      UnNamed = True
    end
    object ClientDataSet1ebook: TDataSetField
      FieldName = 'ebook'
      UnNamed = True
    end
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 72
    Top = 136
  end
  object ClientDataSet2: TClientDataSet
    Aggregates = <>
    DataSetField = ClientDataSet1book
    Params = <>
    Left = 160
    Top = 128
  end
  object ClientDataSet3: TClientDataSet
    Aggregates = <>
    DataSetField = ClientDataSet1ebook
    Params = <>
    Left = 160
    Top = 216
  end
  object DataSource2: TDataSource
    DataSet = ClientDataSet2
    Left = 232
    Top = 128
  end
  object DataSource3: TDataSource
    DataSet = ClientDataSet3
    Left = 232
    Top = 224
  end
end
