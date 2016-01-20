object Form1: TForm1
  Left = 391
  Top = 140
  Width = 510
  Height = 330
  Caption = 'Soap Employee Client'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnGetList: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Get List'
    TabOrder = 0
    OnClick = btnGetListClick
  end
  object btnGetDetails: TButton
    Left = 232
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Get Details'
    TabOrder = 1
    OnClick = btnGetDetailsClick
  end
  object Memo2: TMemo
    Left = 232
    Top = 40
    Width = 265
    Height = 257
    TabOrder = 2
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 40
    Width = 217
    Height = 257
    DataSource = DataSource1
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 88
    Top = 120
  end
  object XMLTransformProvider1: TXMLTransformProvider
    TransformRead.TransformationFile = 'EmplListToDataPacket.xtr'
    Left = 40
    Top = 120
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 136
    Top = 120
  end
end
