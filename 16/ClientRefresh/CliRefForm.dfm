object Form1: TForm1
  Left = 207
  Top = 125
  Width = 719
  Height = 248
  Caption = 'ClientRefresh'
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
    Left = 552
    Top = 8
    Width = 61
    Height = 13
    Caption = 'Refresh Log:'
  end
  object DBGrid1: TDBGrid
    Left = 64
    Top = 40
    Width = 473
    Height = 169
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 64
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Refresh All'
    TabOrder = 1
  end
  object Button2: TButton
    Left = 144
    Top = 8
    Width = 97
    Height = 25
    Caption = 'Refresh Visible'
    TabOrder = 2
    OnClick = Button2Click
  end
  object ListBox1: TListBox
    Left = 552
    Top = 24
    Width = 137
    Height = 185
    ItemHeight = 13
    TabOrder = 3
  end
  object cds: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    RemoteServer = DCOMConnection1
    AfterPost = cdsAfterPost
    AfterScroll = cdsAfterScroll
    Left = 16
    Top = 16
  end
  object DCOMConnection1: TDCOMConnection
    ServerGUID = '{C5DDE903-2214-11D1-98D0-444553540000}'
    ServerName = 'AppServTwo.RdmCount'
    Left = 16
    Top = 72
  end
  object DataSource1: TDataSource
    DataSet = cds
    Left = 16
    Top = 128
  end
end
