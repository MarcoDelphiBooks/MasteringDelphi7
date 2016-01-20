object Form1: TForm1
  Left = 267
  Top = 117
  Width = 252
  Height = 276
  Caption = 'Convert Caller'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object LabelResult: TLabel
    Left = 40
    Top = 200
    Width = 145
    Height = 16
    Alignment = taCenter
    AutoSize = False
    Caption = '0'
  end
  object Button1: TButton
    Left = 80
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Convert'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 72
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Fill List'
    TabOrder = 1
    OnClick = Button2Click
  end
  object EditAmount: TEdit
    Left = 40
    Top = 128
    Width = 145
    Height = 24
    TabOrder = 2
    Text = '1000'
  end
  object ComboBoxFrom: TComboBox
    Left = 40
    Top = 64
    Width = 145
    Height = 24
    Style = csDropDownList
    ItemHeight = 16
    TabOrder = 3
  end
  object ComboBoxTo: TComboBox
    Left = 40
    Top = 96
    Width = 145
    Height = 24
    Style = csDropDownList
    ItemHeight = 16
    TabOrder = 4
  end
end
