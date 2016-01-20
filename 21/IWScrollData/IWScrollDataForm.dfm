object formMain: TformMain
  Left = 0
  Top = 0
  Width = 478
  Height = 360
  Background.Fixed = False
  HandleTabs = False
  SupportedBrowsers = [brIE, brNetscape6]
  OnCreate = IWAppFormCreate
  DesignSize = (
    478
    360)
  DesignLeft = 302
  DesignTop = 164
  object IWDBGrid1: TIWDBGrid
    Left = 40
    Top = 72
    Width = 409
    Height = 241
    Anchors = [akLeft, akTop, akRight, akBottom]
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
    Lines = tlRows
    UseFrame = False
    UseWidth = True
    Columns = <>
    DataSource = DataSource1
    FooterRowCount = 0
    FromStart = False
    HighlightColor = clDefault
    HighlightRows = False
    Options = [dgShowTitles]
    RefreshMode = rmAutomatic
    RowLimit = 10
    RollOver = False
    RowClick = False
    RollOverColor = clNone
    RowHeaderColor = clNone
    RowAlternateColor = clSilver
    RowCurrentColor = clTeal
  end
  object btnNext: TIWButton
    Left = 40
    Top = 40
    Width = 97
    Height = 25
    ZIndex = 0
    ButtonType = btButton
    Caption = 'Next Page'
    Color = clBtnFace
    DoSubmitValidation = True
    Font.Color = clNone
    Font.Enabled = True
    Font.Size = 10
    Font.Style = []
    ScriptEvents = <>
    TabOrder = 0
    OnClick = btnNextClick
  end
  object btnPrevius: TIWButton
    Left = 152
    Top = 40
    Width = 97
    Height = 25
    ZIndex = 0
    ButtonType = btButton
    Caption = 'Previous Page'
    Color = clBtnFace
    DoSubmitValidation = True
    Font.Color = clNone
    Font.Enabled = True
    Font.Size = 10
    Font.Style = []
    ScriptEvents = <>
    TabOrder = 1
    OnClick = btnPreviusClick
  end
  object DataSource1: TDataSource
    DataSet = DataModule1.SimpleDataSet1
    Left = 336
    Top = 32
  end
end
