object RecordForm: TRecordForm
  Left = 0
  Top = 0
  Width = 453
  Height = 320
  Background.Fixed = False
  HandleTabs = False
  SupportedBrowsers = [brIE, brNetscape6, brOpera]
  OnCreate = IWAppFormCreate
  DesignLeft = 354
  DesignTop = 288
  object IWDBEdit1: TIWDBEdit
    Left = 160
    Top = 88
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
    FriendlyName = 'IWDBEdit1'
    MaxLength = 0
    ReadOnly = False
    Required = False
    ScriptEvents = <>
    TabOrder = 0
    AutoEditable = False
    DataField = 'FIRST_NAME'
    DataSource = DataSource1
    PasswordPrompt = False
  end
  object IWDBEdit2: TIWDBEdit
    Left = 160
    Top = 128
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
    FriendlyName = 'IWDBEdit2'
    MaxLength = 0
    ReadOnly = False
    Required = False
    ScriptEvents = <>
    TabOrder = 1
    AutoEditable = False
    DataField = 'LAST_NAME'
    DataSource = DataSource1
    PasswordPrompt = False
  end
  object IWDBEdit3: TIWDBEdit
    Left = 160
    Top = 160
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
    FriendlyName = 'IWDBEdit3'
    MaxLength = 0
    ReadOnly = False
    Required = False
    ScriptEvents = <>
    TabOrder = 2
    AutoEditable = False
    DataField = 'HIRE_DATE'
    DataSource = DataSource1
    PasswordPrompt = False
  end
  object IWDBEdit4: TIWDBEdit
    Left = 160
    Top = 200
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
    FriendlyName = 'IWDBEdit4'
    MaxLength = 0
    ReadOnly = False
    Required = False
    ScriptEvents = <>
    TabOrder = 3
    AutoEditable = False
    DataField = 'JOB_CODE'
    DataSource = DataSource1
    PasswordPrompt = False
  end
  object IWDBNavigator1: TIWDBNavigator
    Left = 80
    Top = 24
    Width = 230
    Height = 25
    ZIndex = 0
    Confirmations.Delete = 'Are you sure you want to delete this record?'
    Confirmations.Post = 'Are you sure you want to update this record?'
    Confirmations.Cancel = 'Are you sure you want to cancel your changes to this record?'
    DataSource = DataSource1
    ImageHeight = 21
    ImageWidth = 21
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
    Orientation = orHorizontal
  end
  object IWLabel1: TIWLabel
    Left = 80
    Top = 88
    Width = 71
    Height = 16
    ZIndex = 0
    Font.Color = clNone
    Font.Enabled = True
    Font.Size = 10
    Font.Style = []
    Caption = 'First Name'
  end
  object IWLabel2: TIWLabel
    Left = 80
    Top = 128
    Width = 71
    Height = 16
    ZIndex = 0
    Font.Color = clNone
    Font.Enabled = True
    Font.Size = 10
    Font.Style = []
    Caption = 'Last Name'
  end
  object IWLabel3: TIWLabel
    Left = 80
    Top = 160
    Width = 62
    Height = 16
    ZIndex = 0
    Font.Color = clNone
    Font.Enabled = True
    Font.Size = 10
    Font.Style = []
    Caption = 'Hire Date'
  end
  object IWLabel4: TIWLabel
    Left = 80
    Top = 200
    Width = 64
    Height = 16
    ZIndex = 0
    Font.Color = clNone
    Font.Enabled = True
    Font.Size = 10
    Font.Style = []
    Caption = 'Job Code'
  end
  object IWButton1: TIWButton
    Left = 344
    Top = 264
    Width = 75
    Height = 25
    ZIndex = 0
    ButtonType = btButton
    Caption = 'Close'
    Color = clBtnFace
    DoSubmitValidation = True
    Font.Color = clNone
    Font.Enabled = True
    Font.Size = 10
    Font.Style = []
    ScriptEvents = <>
    TabOrder = 4
    OnClick = IWButton1Click
  end
  object DataSource1: TDataSource
    Left = 336
    Top = 64
  end
end
