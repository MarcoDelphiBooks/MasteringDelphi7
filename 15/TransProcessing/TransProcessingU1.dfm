object Form1: TForm1
  Left = 192
  Top = 125
  Width = 651
  Height = 319
  Caption = 'Transaction Processing'
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 643
    Height = 33
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Button1: TButton
      Left = 7
      Top = 7
      Width = 72
      Height = 20
      Caption = 'BeginTrans'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 111
      Top = 7
      Width = 72
      Height = 20
      Caption = 'CommitTrans'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 208
      Top = 7
      Width = 79
      Height = 20
      Caption = 'RollbackTrans'
      TabOrder = 2
      OnClick = Button3Click
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 33
    Width = 643
    Height = 259
    Align = alClient
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -10
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'FILE NAME=C:\Program Files\Common Files\SYSTEM\ole db\Data Links' +
      '\DBDEMOS.udl'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 160
    Top = 120
  end
  object ADOTable1: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'customer'
    Left = 288
    Top = 120
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 392
    Top = 120
  end
end
