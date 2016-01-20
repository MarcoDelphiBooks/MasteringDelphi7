object Form1: TForm1
  Left = 192
  Top = 125
  Width = 730
  Height = 289
  Caption = 'Jet Import/Export'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -10
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 40
    Width = 722
    Height = 222
    Align = alClient
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -10
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 722
    Height = 40
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Button1: TButton
      Left = 33
      Top = 13
      Width = 104
      Height = 20
      Caption = 'Export To Paradox'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button3: TButton
      Left = 280
      Top = 13
      Width = 104
      Height = 20
      Caption = 'Export To HTML'
      TabOrder = 1
      OnClick = Button3Click
    end
    object Button2: TButton
      Left = 156
      Top = 13
      Width = 105
      Height = 20
      Caption = 'Export To Excel'
      TabOrder = 2
      OnClick = Button2Click
    end
    object Button4: TButton
      Left = 410
      Top = 13
      Width = 91
      Height = 20
      Caption = 'Import HTML'
      TabOrder = 3
      OnClick = Button4Click
    end
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'FILE NAME=C:\Program Files\Common Files\SYSTEM\ole db\Data Links' +
      '\DBDEMOS.udl'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 
      'C:\Program Files\Common Files\SYSTEM\ole db\Data Links\DBDEMOS.u' +
      'dl'
    Left = 272
    Top = 32
  end
  object ADOTable1: TADOTable
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=Customer.htm;Extend' +
      'ed Properties=HTML Import;Persist Security Info=False'
    TableName = 'Customer'
    Left = 272
    Top = 88
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 272
    Top = 152
  end
end
