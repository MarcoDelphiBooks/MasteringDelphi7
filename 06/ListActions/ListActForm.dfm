object Form1: TForm1
  Left = 219
  Top = 107
  Width = 329
  Height = 395
  Caption = 'ListActions'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    321
    368)
  PixelsPerInch = 96
  TextHeight = 13
  object ListBox1: TListBox
    Left = 8
    Top = 64
    Width = 305
    Height = 145
    Anchors = [akLeft, akTop, akRight]
    ItemHeight = 13
    TabOrder = 0
  end
  object ActionToolBar1: TActionToolBar
    Left = 0
    Top = 0
    Width = 321
    Height = 25
    ActionManager = ActionManager1
    Caption = 'ActionToolBar1'
    ColorMap.HighlightColor = 14410210
    ColorMap.BtnSelectedColor = clBtnFace
    ColorMap.UnusedColor = 14410210
    EdgeBorders = [ebTop, ebBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Spacing = 0
  end
  object ActionToolBar2: TActionToolBar
    Left = 0
    Top = 25
    Width = 321
    Height = 25
    ActionManager = ActionManager1
    Caption = 'ActionToolBar2'
    ColorMap.HighlightColor = 14410210
    ColorMap.BtnSelectedColor = clBtnFace
    ColorMap.UnusedColor = 14410210
    EdgeBorders = [ebTop, ebBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Spacing = 0
  end
  object ListBox2: TListBox
    Left = 8
    Top = 216
    Width = 305
    Height = 145
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 13
    TabOrder = 3
  end
  object ActionManager1: TActionManager
    ActionBars.SessionCount = 1
    ActionBars = <
      item
        Items = <
          item
            Action = StaticListAction1
            Caption = '&Numbers'
          end
          item
            Action = VirtualListAction1
            Caption = '&Items'
          end>
        ActionBar = ActionToolBar1
        AutoSize = False
      end
      item
        Items = <
          item
            Items = <
              item
                Action = StaticListAction1
              end>
            Caption = '&List'
          end>
        AutoSize = False
      end
      item
        Items = <
          item
            Action = ListControlCopySelection1
            Caption = '&Copy'
          end
          item
            Action = ListControlDeleteSelection1
            Caption = '&Delete'
          end
          item
            Action = ListControlMoveSelection2
            Caption = '&Move'
          end>
        ActionBar = ActionToolBar2
        AutoSize = False
      end>
    Left = 48
    Top = 88
    StyleName = 'XP Style'
    object StaticListAction1: TStaticListAction
      Category = 'List'
      Caption = 'Numbers'
      ItemIndex = 0
      Items = <
        item
          Caption = 'one'
        end
        item
          Caption = 'two'
        end
        item
          Caption = 'three'
        end
        item
          Caption = 'four'
        end>
      OnItemSelected = ListActionItemSelected
    end
    object VirtualListAction1: TVirtualListAction
      Category = 'List'
      Caption = 'Items'
      ItemIndex = 0
      OnGetItem = VirtualListAction1GetItem
      OnGetItemCount = VirtualListAction1GetItemCount
      OnItemSelected = ListActionItemSelected
    end
    object ListControlCopySelection1: TListControlCopySelection
      Category = 'List'
      Caption = 'Copy'
      Destination = ListBox2
      ListControl = ListBox1
    end
    object ListControlDeleteSelection1: TListControlDeleteSelection
      Category = 'List'
      Caption = 'Delete'
    end
    object ListControlMoveSelection2: TListControlMoveSelection
      Category = 'List'
      Caption = 'Move'
      Destination = ListBox2
      ListControl = ListBox1
    end
  end
  object ListControlMoveSelection1: TListControlMoveSelection
    Category = 'List'
    Caption = 'ListControlMoveSelection1'
  end
end
