object Form1: TForm1
  Left = 225
  Top = 116
  Width = 645
  Height = 412
  HorzScrollBar.Range = 689
  VertScrollBar.Range = 473
  ActiveControl = DBGrid1
  AutoScroll = False
  Caption = 'MyBase1'
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
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 681
    Height = 465
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DataSource1: TDataSource
    DataSet = cds
    Left = 56
    Top = 32
  end
  object cds: TClientDataSet
    Aggregates = <>
    FileName = 'C:\Program Files\Common Files\Borland Shared\Data\customer.cds'
    Params = <>
    Left = 56
    Top = 104
  end
end
