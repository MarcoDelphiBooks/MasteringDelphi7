object FrameList: TFrameList
  Left = 0
  Top = 0
  Width = 202
  Height = 306
  TabOrder = 0
  object Bevel: TBevel
    Left = 0
    Top = 0
    Width = 202
    Height = 306
    Align = alClient
    Shape = bsFrame
  end
  object ListBox: TListBox
    Left = 8
    Top = 64
    Width = 185
    Height = 233
    ItemHeight = 13
    TabOrder = 0
  end
  object Edit: TEdit
    Left = 8
    Top = 40
    Width = 185
    Height = 21
    TabOrder = 1
    Text = 'Some text'
  end
  object btnAdd: TButton
    Left = 24
    Top = 8
    Width = 49
    Height = 25
    Caption = '&Add'
    TabOrder = 2
    OnClick = btnAddClick
  end
  object btnRemove: TButton
    Left = 76
    Top = 8
    Width = 49
    Height = 25
    Caption = '&Remove'
    TabOrder = 3
    OnClick = btnRemoveClick
  end
  object btnClear: TButton
    Left = 128
    Top = 8
    Width = 49
    Height = 25
    Caption = '&Clear'
    TabOrder = 4
    OnClick = btnClearClick
  end
end
