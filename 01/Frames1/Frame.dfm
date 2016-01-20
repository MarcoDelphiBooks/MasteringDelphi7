object Frame1: TFrame1
  Left = 0
  Top = 0
  Width = 266
  Height = 197
  TabOrder = 0
  object EditList: TEdit
    Left = 8
    Top = 8
    Width = 169
    Height = 21
    TabOrder = 0
  end
  object ListList: TListBox
    Left = 8
    Top = 32
    Width = 169
    Height = 161
    ItemHeight = 13
    TabOrder = 1
  end
  object btnAdd: TButton
    Left = 184
    Top = 56
    Width = 75
    Height = 25
    Caption = '&Add'
    TabOrder = 2
    OnClick = btnAddClick
  end
  object btnDelete: TButton
    Left = 184
    Top = 88
    Width = 75
    Height = 25
    Caption = '&Delete'
    TabOrder = 3
    OnClick = btnDeleteClick
  end
end
