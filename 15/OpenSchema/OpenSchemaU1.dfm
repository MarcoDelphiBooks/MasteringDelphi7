object Form1: TForm1
  Left = 192
  Top = 125
  Width = 679
  Height = 346
  Caption = 'TADOConnection.OpenSchema'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -10
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 33
    Width = 671
    Height = 286
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
    Width = 671
    Height = 33
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Button1: TButton
      Left = 13
      Top = 7
      Width = 98
      Height = 20
      Caption = 'Get Primary Keys'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 124
      Top = 7
      Width = 143
      Height = 20
      Caption = 'Get Customer Primary Keys'
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Program Files\Co' +
      'mmon Files\Borland Shared\Data\DBDEMOS.mdb;Persist Security Info' +
      '=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 152
    Top = 40
  end
  object DataSource1: TDataSource
    DataSet = ADODataSet1
    Left = 456
    Top = 40
  end
  object ADODataSet1: TADODataSet
    Parameters = <>
    Left = 288
    Top = 40
  end
end
