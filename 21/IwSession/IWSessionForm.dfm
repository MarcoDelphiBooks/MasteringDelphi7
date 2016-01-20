object formMain: TformMain
  Left = 0
  Top = 0
  Width = 349
  Height = 296
  Background.Fixed = False
  HandleTabs = False
  SupportedBrowsers = [brIE, brNetscape6]
  DesignLeft = 314
  DesignTop = 162
  object IWButton1: TIWButton
    Left = 48
    Top = 48
    Width = 75
    Height = 25
    ZIndex = 0
    ButtonType = btButton
    Caption = 'Update'
    Color = clBtnFace
    DoSubmitValidation = True
    Font.Color = clNone
    Font.Enabled = True
    Font.Size = 10
    Font.Style = []
    ScriptEvents = <>
    TabOrder = 0
    OnClick = IWButton1Click
  end
  object IWLabel1: TIWLabel
    Left = 120
    Top = 120
    Width = 62
    Height = 16
    ZIndex = 0
    Font.Color = clNone
    Font.Enabled = True
    Font.Size = 10
    Font.Style = []
    Caption = 'IWLabel1'
  end
  object IWLabel2: TIWLabel
    Left = 120
    Top = 152
    Width = 62
    Height = 16
    ZIndex = 0
    Font.Color = clNone
    Font.Enabled = True
    Font.Size = 10
    Font.Style = []
    Caption = 'IWLabel2'
  end
  object IWLabel3: TIWLabel
    Left = 120
    Top = 184
    Width = 62
    Height = 16
    ZIndex = 0
    Font.Color = clNone
    Font.Enabled = True
    Font.Size = 10
    Font.Style = []
    Caption = 'IWLabel3'
  end
  object IWTimer1: TIWTimer
    Left = 256
    Top = 72
    Width = 24
    Height = 24
    ZIndex = 0
    Enabled = False
    Interval = 5000
    OnTimer = IWTimer1Timer
  end
  object IWCheckBox1: TIWCheckBox
    Left = 171
    Top = 52
    Width = 121
    Height = 21
    ZIndex = 0
    Caption = 'Use Timer'
    Editable = True
    Font.Color = clNone
    Font.Enabled = True
    Font.Size = 10
    Font.Style = []
    ScriptEvents = <>
    DoSubmitValidation = True
    OnClick = IWCheckBox1Click
    Style = stNormal
    TabOrder = 1
    Checked = False
  end
end
