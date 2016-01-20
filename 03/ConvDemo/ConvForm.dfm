object Form1: TForm1
  Left = 192
  Top = 107
  Width = 557
  Height = 290
  Caption = 'ConvDemo (Conversion Demo)'
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
    Left = 224
    Top = 72
    Width = 54
    Height = 13
    Caption = 'Base &Type:'
  end
  object Label2: TLabel
    Left = 352
    Top = 72
    Width = 39
    Height = 13
    Caption = '&Amount:'
  end
  object Label3: TLabel
    Left = 48
    Top = 16
    Width = 37
    Height = 13
    Caption = '&Families'
  end
  object Label4: TLabel
    Left = 352
    Top = 144
    Width = 88
    Height = 13
    Caption = 'Converted Amount'
  end
  object Label5: TLabel
    Left = 48
    Top = 72
    Width = 32
    Height = 13
    Caption = 'T&ypes:'
  end
  object Label6: TLabel
    Left = 224
    Top = 144
    Width = 80
    Height = 13
    Caption = '&Destination Type'
  end
  object Label7: TLabel
    Left = 352
    Top = 24
    Width = 112
    Height = 39
    Caption = 'Instructions: drag types from list to edit boxes, enter amout'
    WordWrap = True
  end
  object ComboFamilies: TComboBox
    Left = 48
    Top = 32
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 0
    OnChange = ChangeFamily
    OnSelect = ChangeFamily
  end
  object ListTypes: TListBox
    Left = 48
    Top = 88
    Width = 145
    Height = 161
    DragMode = dmAutomatic
    ItemHeight = 13
    TabOrder = 1
  end
  object EditType: TEdit
    Left = 224
    Top = 88
    Width = 121
    Height = 21
    TabOrder = 2
    OnChange = DoConvert
    OnDragDrop = EditTypeDragDrop
    OnDragOver = EditTypeDragOver
  end
  object EditAmount: TEdit
    Left = 352
    Top = 88
    Width = 121
    Height = 21
    TabOrder = 3
    Text = '100'
    OnChange = DoConvert
  end
  object EditConverted: TEdit
    Left = 352
    Top = 160
    Width = 121
    Height = 21
    Color = clInactiveCaptionText
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ReadOnly = True
    ShowHint = False
    TabOrder = 4
  end
  object BtnSimple: TButton
    Left = 232
    Top = 32
    Width = 75
    Height = 25
    Caption = '&Simple Test'
    TabOrder = 5
    OnClick = BtnSimpleClick
  end
  object EditDestination: TEdit
    Left = 224
    Top = 160
    Width = 121
    Height = 21
    TabOrder = 6
    OnChange = DoConvert
    OnDragDrop = EditTypeDragDrop
    OnDragOver = EditTypeDragOver
  end
  object BtnConvert: TButton
    Left = 296
    Top = 208
    Width = 113
    Height = 25
    Caption = '&Convert'
    TabOrder = 7
    OnClick = DoConvert
  end
end
