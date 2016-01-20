object FormDrag: TFormDrag
  Left = 243
  Top = 107
  Width = 609
  Height = 345
  HorzScrollBar.Range = 577
  VertScrollBar.Range = 281
  ActiveControl = DBGrid1
  AutoScroll = False
  Caption = 'DragToGrid'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = 11
  Font.Name = 'MS Sans Serif'
  Font.Pitch = fpVariable
  Font.Style = []
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LabelDrag: TLabel
    Left = 24
    Top = 16
    Width = 346
    Height = 13
    Caption = 
      'Enter a value in the edit below and drag this label over the tar' +
      'get grid cell:'
    DragMode = dmAutomatic
  end
  object DBGrid1: TDBGrid
    Left = 24
    Top = 56
    Width = 553
    Height = 225
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = 11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Pitch = fpVariable
    TitleFont.Style = []
    OnDragDrop = DBGrid1DragDrop
    OnDragOver = DBGrid1DragOver
  end
  object EditDrag: TEdit
    Left = 24
    Top = 32
    Width = 345
    Height = 21
    TabOrder = 1
    Text = 'New Value'
  end
  object DataSource1: TDataSource
    DataSet = cds
    Left = 496
    Top = 72
  end
  object cds: TClientDataSet
    Aggregates = <>
    FileName = 'C:\Program Files\Common Files\Borland Shared\Data\country.cds'
    Params = <>
    Left = 496
    Top = 120
  end
end
