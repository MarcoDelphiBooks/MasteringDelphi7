object FormClasses: TFormClasses
  Left = 200
  Top = 141
  Width = 658
  Height = 458
  Caption = 'Corsi'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 161
    Width = 650
    Height = 3
    Cursor = crVSplit
    Align = alTop
  end
  object Splitter3: TSplitter
    Left = 0
    Top = 273
    Width = 650
    Height = 3
    Cursor = crVSplit
    Align = alTop
  end
  object Tab: TTabControl
    Left = 0
    Top = 0
    Width = 650
    Height = 161
    Align = alTop
    TabOrder = 0
    Tabs.Strings = (
      'Open'
      'Closed'
      'Past')
    TabIndex = 0
    OnChange = TabChange
    object DBGridClasses: TDBGrid
      Left = 4
      Top = 24
      Width = 642
      Height = 133
      Align = alClient
      DataSource = dsClasses
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRIPTION'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STARTS_ON'
          Visible = True
        end>
    end
  end
  object DBGridPeopleReg: TDBGrid
    Left = 0
    Top = 276
    Width = 650
    Height = 155
    Align = alClient
    DataSource = dsPeopleReg
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnEditButtonClick = DBGridPeopleRegEditButtonClick
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        ReadOnly = True
        Visible = True
      end
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'NAME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AMOUNT'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 164
    Width = 650
    Height = 109
    Align = alTop
    TabOrder = 2
    object Splitter2: TSplitter
      Left = 305
      Top = 1
      Width = 3
      Height = 107
      Cursor = crHSplit
    end
    object DBGridClassReg: TDBGrid
      Left = 1
      Top = 1
      Width = 304
      Height = 107
      Align = alLeft
      DataSource = dsClassReg
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnEditButtonClick = DBGridClassRegEditButtonClick
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          ReadOnly = True
          Visible = True
        end
        item
          ButtonStyle = cbsEllipsis
          Expanded = False
          FieldName = 'NAME'
          Width = 164
          Visible = True
        end>
    end
    object MemoNote: TDBMemo
      Left = 308
      Top = 1
      Width = 341
      Height = 107
      Align = alClient
      DataField = 'NOTES'
      DataSource = dsClassReg
      TabOrder = 1
    end
  end
  object dsClassReg: TDataSource
    Left = 80
    Top = 208
  end
  object dsClasses: TDataSource
    Left = 48
    Top = 56
  end
  object dsPeopleReg: TDataSource
    Left = 80
    Top = 320
  end
end
