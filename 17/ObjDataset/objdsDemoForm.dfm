object Form2: TForm2
  Left = 280
  Top = 148
  Width = 738
  Height = 301
  Caption = 'Form2'
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
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 730
    Height = 233
    Align = alClient
    DataSource = DataSource1
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
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
    Width = 730
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object DBNavigator1: TDBNavigator
      Left = 169
      Top = 8
      Width = 240
      Height = 25
      DataSource = DataSource1
      TabOrder = 0
    end
    object Button1: TButton
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Add Object'
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 88
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Descriptions'
      TabOrder = 2
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 646
      Top = 8
      Width = 75
      Height = 25
      Caption = 'To DB'
      TabOrder = 3
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 494
      Top = 8
      Width = 75
      Height = 25
      Caption = 'From DB'
      TabOrder = 4
      OnClick = Button4Click
    end
    object Button5: TButton
      Left = 414
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Create Table'
      TabOrder = 5
      OnClick = Button5Click
    end
    object Button6: TButton
      Left = 576
      Top = 8
      Width = 65
      Height = 25
      Caption = 'Proxi'
      TabOrder = 6
      OnClick = Button6Click
    end
  end
  object DataSource1: TDataSource
    Left = 48
    Top = 88
  end
end
