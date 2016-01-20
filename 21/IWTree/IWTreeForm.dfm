object formTree: TformTree
  Left = 0
  Top = 0
  Width = 404
  Height = 383
  Background.Fixed = False
  HandleTabs = False
  SupportedBrowsers = [brIE, brNetscape6]
  DesignLeft = 314
  DesignTop = 127
  object IWTreeView1: TIWTreeView
    Left = 0
    Top = 20
    Width = 404
    Height = 363
    Align = alClient
    ZIndex = 0
    Font.Color = clNone
    Font.Enabled = True
    Font.Size = 10
    Font.Style = []
    Items = <
      item
        Caption = 'IWTreeView1Item0'
        Expanded = True
        Name = 'IWTreeView1Item0'
        SubItems = <
          item
            Caption = 'IWTreeView1Item1'
            Expanded = True
            Name = 'IWTreeView1Item1'
            SubItems = <
              item
                Caption = 'IWTreeView1Item2'
                Expanded = True
                Name = 'IWTreeView1Item2'
                SubItems = <
                  item
                    Caption = 'IWTreeView1Item3'
                    Expanded = True
                    Name = 'IWTreeView1Item3'
                    SubItems = <>
                  end>
              end
              item
                Caption = 'IWTreeView1Item8'
                Expanded = True
                Name = 'IWTreeView1Item8'
                SubItems = <>
              end>
          end
          item
            Caption = 'IWTreeView1Item9'
            Expanded = True
            Name = 'IWTreeView1Item9'
            SubItems = <>
          end
          item
            Caption = 'IWTreeView1Item10'
            Expanded = True
            Name = 'IWTreeView1Item10'
            SubItems = <>
          end>
      end
      item
        Caption = 'IWTreeView1Item4'
        Expanded = True
        Name = 'IWTreeView1Item4'
        SubItems = <
          item
            Caption = 'IWTreeView1Item5'
            Expanded = True
            Name = 'IWTreeView1Item5'
            SubItems = <
              item
                Caption = 'IWTreeView1Item6'
                Expanded = True
                Name = 'IWTreeView1Item6'
                SubItems = <>
              end>
          end
          item
            Caption = 'IWTreeView1Item7'
            Expanded = True
            Name = 'IWTreeView1Item7'
            SubItems = <>
          end
          item
            Caption = 'IWTreeView1Item11'
            Expanded = True
            Name = 'IWTreeView1Item11'
            SubItems = <
              item
                Caption = 'IWTreeView1Item13'
                Expanded = True
                Name = 'IWTreeView1Item13'
                SubItems = <>
              end>
          end
          item
            Caption = 'IWTreeView1Item12'
            Expanded = True
            Name = 'IWTreeView1Item12'
            SubItems = <>
          end>
      end>
    VertScrollBarVisible = False
    HorScrollBarVisible = False
  end
  object IWMenu1: TIWMenu
    Left = 0
    Top = 0
    Width = 404
    Height = 20
    Align = alTop
    ZIndex = 0
    AttachedMenu = MainMenu1
    ItemSpacing = itsNone
    AutoSize = mnaNone
    MenuStyle.Alignment = maBottom
    MenuStyle.Animation = True
    MenuStyle.AnimationSpeed = 4
    MenuStyle.AnimationInterval = 20
    MenuStyle.Border = False
    MenuStyle.Color = clMenu
    MenuStyle.Font.Color = clMenuText
    MenuStyle.Font.Name = 'arial,helvetica'
    MenuStyle.Font.Size = 12
    MenuStyle.Font.Style = [fsBold]
    MenuStyle.Height = 20
    MenuStyle.HighLightTextColor = clHighlightText
    MenuStyle.HighlightColor = clHighlight
    MenuStyle.Width = 100
    MenuItemStyle.Alignment = maBottom
    MenuItemStyle.Animation = True
    MenuItemStyle.AnimationSpeed = 4
    MenuItemStyle.AnimationInterval = 20
    MenuItemStyle.Border = True
    MenuItemStyle.Color = clMenu
    MenuItemStyle.Font.Color = clMenuText
    MenuItemStyle.Font.Name = 'arial,helvetica'
    MenuItemStyle.Font.Size = 11
    MenuItemStyle.Font.Style = [fsBold]
    MenuItemStyle.Height = 18
    MenuItemStyle.HighLightTextColor = clHighlightText
    MenuItemStyle.HighlightColor = clHighlight
    MenuItemStyle.Width = 120
    Orientation = iwOHorizontal
    TimeOut = 1000
  end
  object MainMenu1: TMainMenu
    Left = 48
    Top = 48
    object Tree1: TMenuItem
      Caption = 'Tree'
      object ExpandAll1: TMenuItem
        Caption = 'Expand All'
        OnClick = ExpandAll1Click
      end
      object CollapseAll1: TMenuItem
        Caption = 'Collapse All'
        OnClick = CollapseAll1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object EnlargeFont1: TMenuItem
        Caption = 'Enlarge Font'
        OnClick = EnlargeFont1Click
      end
      object ReduceFont1: TMenuItem
        Caption = 'Reduce Font'
        OnClick = ReduceFont1Click
      end
    end
    object About1: TMenuItem
      Caption = 'About'
      object Application1: TMenuItem
        Caption = 'Application'
        OnClick = Application1Click
      end
      object TreeContents1: TMenuItem
        Caption = 'Tree Contents'
        OnClick = TreeContents1Click
      end
    end
  end
end
