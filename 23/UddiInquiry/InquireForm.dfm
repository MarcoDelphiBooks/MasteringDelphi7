object Form1: TForm1
  Left = 177
  Top = 79
  Width = 777
  Height = 603
  Caption = 'UDDI Inquiry Demo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 16
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 769
    Height = 576
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Data'
      DesignSize = (
        761
        545)
      object Label1: TLabel
        Left = 8
        Top = 24
        Width = 76
        Height = 16
        Caption = 'Search for:'
      end
      object Label2: TLabel
        Left = 14
        Top = 52
        Width = 57
        Height = 32
        Caption = 'UDDI registry:'
        WordWrap = True
      end
      object edSearch: TEdit
        Left = 88
        Top = 22
        Width = 217
        Height = 24
        TabOrder = 0
      end
      object btnSearch: TButton
        Left = 320
        Top = 22
        Width = 137
        Height = 20
        Caption = 'Search by Name'
        TabOrder = 1
        OnClick = btnSearchClick
      end
      object comboRegistry: TComboBox
        Left = 88
        Top = 56
        Width = 369
        Height = 24
        Style = csDropDownList
        ItemHeight = 16
        ItemIndex = 0
        TabOrder = 2
        Text = 'http://test.uddi.microsoft.com/inquire'
        Items.Strings = (
          'http://test.uddi.microsoft.com/inquire'
          'http://uddi.microsoft.com/inquire'
          'http://www-3.ibm.com/services/uddi/inquiryapi'
          'http://www-3.ibm.com/services/uddi/testregistry/inquiryapi'
          'http://services.xmethods.net:80/glue/inquire/uddi')
      end
      object ListView1: TListView
        Left = 8
        Top = 104
        Width = 745
        Height = 161
        Anchors = [akLeft, akTop, akRight]
        Columns = <
          item
            Caption = 'Name'
            Width = 200
          end
          item
            Caption = 'Description'
            Width = 200
          end
          item
            Caption = 'BusinessKey'
            Width = 200
          end>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        ViewStyle = vsReport
        OnDblClick = ListView1DblClick
      end
      object btnCategory: TButton
        Left = 480
        Top = 40
        Width = 177
        Height = 18
        Caption = 'Search by Category'
        TabOrder = 4
        OnClick = btnCategoryClick
      end
      object edValue: TEdit
        Left = 477
        Top = 64
        Width = 121
        Height = 24
        TabOrder = 5
        Text = 'US'
      end
      object edKey: TEdit
        Left = 616
        Top = 64
        Width = 121
        Height = 24
        TabOrder = 6
        Text = '--'
      end
      object PageControl2: TPageControl
        Left = 8
        Top = 272
        Width = 745
        Height = 265
        ActivePage = TabSheet3
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 7
        object TabSheet3: TTabSheet
          Caption = 'Text View'
          object MemoData: TMemo
            Left = 0
            Top = 0
            Width = 737
            Height = 234
            Align = alClient
            ScrollBars = ssBoth
            TabOrder = 0
          end
        end
        object TabSheet4: TTabSheet
          Caption = 'XML View'
          ImageIndex = 1
          object WebBrowser1: TWebBrowser
            Left = 0
            Top = 0
            Width = 737
            Height = 234
            Align = alClient
            TabOrder = 0
            ControlData = {
              4C0000002C4C00002F1800000000000000000000000000000000000000000000
              000000004C000000000000000000000001000000E0D057007335CF11AE690800
              2B2E126208000000000000004C0000000114020000000000C000000000000046
              8000000000000000000000000000000000000000000000000000000000000000
              00000000000000000100000000000000000000000000000000000000}
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Log'
      ImageIndex = 1
      object MemoLog: TMemo
        Left = 0
        Top = 0
        Width = 696
        Height = 478
        Align = alClient
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
  end
  object HTTPRIO1: THTTPRIO
    OnAfterExecute = HTTPRIO1AfterExecute
    OnBeforeExecute = HTTPRIO1BeforeExecute
    HTTPWebNode.Agent = 'Borland SOAP 1.1'
    HTTPWebNode.UseUTF8InHeader = True
    HTTPWebNode.InvokeOptions = []
    Converter.Options = [soSendMultiRefObj, soTryAllSchema, soUTF8InHeader, soDontSendEmptyNodes]
    Left = 536
    Top = 24
  end
end
