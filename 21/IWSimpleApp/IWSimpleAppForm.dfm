object formMain: TformMain
  Left = 0
  Top = 0
  Width = 310
  Height = 305
  Background.Fixed = False
  HandleTabs = False
  SupportedBrowsers = [brIE, brNetscape6]
  DesignLeft = 303
  DesignTop = 196
  object IWEdit1: TIWEdit
    Left = 40
    Top = 40
    Width = 121
    Height = 21
    ZIndex = 0
    BGColor = clNone
    DoSubmitValidation = True
    Editable = True
    Font.Color = clNone
    Font.Enabled = True
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'IWEdit1'
    MaxLength = 0
    ReadOnly = False
    Required = False
    ScriptEvents = <>
    TabOrder = 0
    PasswordPrompt = False
    Text = 'four'
  end
  object IWButton1: TIWButton
    Left = 182
    Top = 37
    Width = 75
    Height = 25
    ZIndex = 0
    ButtonType = btButton
    Caption = 'Add Item'
    Color = clBtnFace
    DoSubmitValidation = True
    Font.Color = clNone
    Font.Enabled = True
    Font.Size = 10
    Font.Style = []
    ScriptEvents = <>
    TabOrder = 1
    OnClick = IWButton1Click
  end
  object IWListbox1: TIWListbox
    Left = 40
    Top = 72
    Width = 217
    Height = 169
    ZIndex = 0
    Font.Color = clNone
    Font.Enabled = True
    Font.Size = 10
    Font.Style = []
    ItemsHaveValues = False
    NoSelectionText = '-- No Selection --'
    RequireSelection = True
    ScriptEvents = <>
    UseSize = False
    DoSubmitValidation = True
    Editable = True
    TabOrder = 2
    ItemIndex = -1
    Items.Strings = (
      'one'
      'two'
      'three')
    MultiSelect = False
    Sorted = False
  end
  object IWButton2: TIWButton
    Left = 72
    Top = 256
    Width = 75
    Height = 25
    ZIndex = 0
    ButtonType = btButton
    Caption = 'Show (1)'
    Color = clBtnFace
    DoSubmitValidation = True
    Font.Color = clNone
    Font.Enabled = True
    Font.Size = 10
    Font.Style = []
    ScriptEvents = <>
    TabOrder = 3
    OnClick = IWButton2Click
  end
  object IWButton3: TIWButton
    Left = 160
    Top = 256
    Width = 75
    Height = 25
    ZIndex = 0
    ButtonType = btButton
    Caption = 'Show (2)'
    Color = clBtnFace
    DoSubmitValidation = True
    Font.Color = clNone
    Font.Enabled = True
    Font.Size = 10
    Font.Style = []
    ScriptEvents = <
      item
        EventCode.Strings = (
          'window.alert(ASender.value);')
        Event = 'onClick'
      end>
    TabOrder = 4
  end
end
