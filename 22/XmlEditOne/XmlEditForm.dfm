object FormXmlEdit: TFormXmlEdit
  Left = 203
  Top = 141
  Width = 621
  Height = 385
  Caption = 'Xml Edit One'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Microsoft Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 25
    Width = 613
    Height = 333
    ActivePage = TabSheet7
    Align = alClient
    TabOrder = 0
    object TabSheet5: TTabSheet
      Caption = 'Settings'
      ImageIndex = 4
      object Label1: TLabel
        Left = 184
        Top = 88
        Width = 36
        Height = 13
        Caption = 'Xml File'
      end
      object Label4: TLabel
        Left = 32
        Top = 24
        Width = 29
        Height = 13
        Caption = 'Folder'
      end
      object Label5: TLabel
        Left = 296
        Top = 24
        Width = 69
        Height = 13
        Caption = 'Base Filename'
      end
      object EditXmlFile: TEdit
        Left = 184
        Top = 104
        Width = 281
        Height = 21
        TabOrder = 0
      end
      object EditFolder: TEdit
        Left = 32
        Top = 40
        Width = 249
        Height = 21
        TabOrder = 1
        OnChange = EditFolderOrFileChange
      end
      object EditBaseFile: TEdit
        Left = 296
        Top = 40
        Width = 169
        Height = 21
        TabOrder = 2
        Text = 'Sample'
        OnChange = EditFolderOrFileChange
      end
      object btnUpdate: TButton
        Left = 48
        Top = 88
        Width = 75
        Height = 25
        Caption = 'Update Files'
        TabOrder = 3
        OnClick = btnUpdateClick
      end
      object cbAutoUpdate: TCheckBox
        Left = 48
        Top = 120
        Width = 81
        Height = 17
        Caption = 'Auto Update'
        Checked = True
        State = cbChecked
        TabOrder = 4
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'XML'
      object MemoXml: TMemo
        Left = 0
        Top = 0
        Width = 605
        Height = 284
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 0
        OnChange = MemoXmlChange
        OnKeyUp = MemoXmlKeyUp
        OnMouseUp = MemoXmlMouseUp
      end
      object xmlBar: TStatusBar
        Left = 0
        Top = 284
        Width = 605
        Height = 21
        Panels = <
          item
            Width = 70
          end
          item
            Width = 70
          end
          item
            Width = 500
          end>
      end
    end
    object TabSheet7: TTabSheet
      Caption = 'XML View'
      ImageIndex = 6
      OnEnter = TabSheet7Enter
      object XmlBrowser: TWebBrowser
        Left = 0
        Top = 0
        Width = 605
        Height = 305
        Align = alClient
        TabOrder = 0
        OnEnter = TabSheet7Enter
        ControlData = {
          4C000000873E0000861F00000000000000000000000000000000000000000000
          000000004C000000000000000000000001000000E0D057007335CF11AE690800
          2B2E126208000000000000004C0000000114020000000000C000000000000046
          8000000000000000000000000000000000000000000000000000000000000000
          00000000000000000100000000000000000000000000000000000000}
      end
    end
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 613
    Height = 25
    ButtonHeight = 21
    ButtonWidth = 44
    Caption = 'ToolBar1'
    EdgeBorders = [ebTop, ebBottom]
    Flat = True
    ShowCaptions = True
    TabOrder = 1
    object btnLoad: TToolButton
      Left = 0
      Top = 0
      Caption = '&Load'
      ImageIndex = 0
      OnClick = btnLoadClick
    end
    object btnSave: TToolButton
      Left = 44
      Top = 0
      Caption = '&Save'
      ImageIndex = 2
      OnClick = btnSaveClick
    end
    object ToolButton1: TToolButton
      Left = 88
      Top = 0
      Caption = 'Refresh'
      ImageIndex = 3
      OnClick = TabSheet7Enter
    end
  end
  object XMLDoc: TXMLDocument
    Left = 376
    Top = 32
    DOMVendorDesc = 'MSXML'
  end
end
