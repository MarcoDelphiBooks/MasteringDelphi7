object Frame3: TFrame3
  Left = 0
  Top = 0
  Width = 362
  Height = 277
  Align = alClient
  TabOrder = 0
  object LabelFile: TLabel
    Left = 40
    Top = 16
    Width = 39
    Height = 13
    Caption = 'List.txt'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 19
    Height = 13
    Caption = 'File:'
  end
  object ListBox1: TListBox
    Left = 16
    Top = 32
    Width = 169
    Height = 209
    ItemHeight = 13
    TabOrder = 0
  end
  object btnAdd: TButton
    Left = 200
    Top = 32
    Width = 75
    Height = 25
    Caption = '&Add'
    TabOrder = 1
    OnClick = btnAddClick
  end
  object btnDelete: TButton
    Left = 200
    Top = 64
    Width = 75
    Height = 25
    Caption = '&Delete'
    TabOrder = 2
    OnClick = btnDeleteClick
  end
  object btnSave: TButton
    Left = 200
    Top = 96
    Width = 75
    Height = 25
    Caption = '&Save'
    TabOrder = 3
    OnClick = btnSaveClick
  end
end
