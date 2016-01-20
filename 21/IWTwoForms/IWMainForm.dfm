object formMain: TformMain
  Left = 0
  Top = 0
  Width = 405
  Height = 285
  Background.Fixed = False
  HandleTabs = False
  SupportedBrowsers = [brIE, brNetscape6]
  OnCreate = IWAppFormCreate
  DesignSize = (
    405
    285)
  DesignLeft = 311
  DesignTop = 169
  object IWGrid1: TIWGrid
    Left = 28
    Top = 47
    Width = 353
    Height = 209
    Anchors = []
    ZIndex = 0
    BorderColors.Color = clNone
    BorderColors.Light = clNone
    BorderColors.Dark = clNone
    BGColor = clNone
    BorderSize = 1
    BorderStyle = tfDefault
    CellPadding = 0
    CellSpacing = 0
    Font.Color = clNone
    Font.Enabled = True
    Font.Size = 10
    Font.Style = []
    FrameBuffer = 40
    Lines = tlAll
    Summary = 'This is a grid'
    UseFrame = False
    UseWidth = True
    ColumnCount = 3
    RowCount = 5
  end
  object btnShowGraphic: TIWButton
    Left = 28
    Top = 10
    Width = 109
    Height = 25
    ZIndex = 0
    ButtonType = btButton
    Caption = 'Show Graphic'
    Color = clBtnFace
    DoSubmitValidation = True
    Font.Color = clNone
    Font.Enabled = True
    Font.Size = 10
    Font.Style = []
    ScriptEvents = <>
    TabOrder = 0
    OnClick = btnShowGraphicClick
  end
  object btnCloseMain: TIWButton
    Left = 144
    Top = 10
    Width = 105
    Height = 25
    ZIndex = 0
    ButtonType = btButton
    Caption = 'Close Main'
    Color = clBtnFace
    DoSubmitValidation = True
    Font.Color = clNone
    Font.Enabled = True
    Font.Size = 10
    Font.Style = []
    ScriptEvents = <>
    TabOrder = 1
    OnClick = btnCloseMainClick
  end
end
