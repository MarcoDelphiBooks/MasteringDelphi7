object Form1: TForm1
  Left = 180
  Top = 112
  Width = 696
  Height = 480
  Caption = 'Form1'
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
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 688
    Height = 453
    ActivePage = TabSheet1
    Align = alClient
    TabIndex = 0
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Data'
      object Label1: TLabel
        Left = 24
        Top = 24
        Width = 52
        Height = 13
        Caption = 'Search for:'
      end
      object Label2: TLabel
        Left = 14
        Top = 60
        Width = 66
        Height = 13
        Caption = 'UDDI registry:'
      end
      object edSearch: TEdit
        Left = 88
        Top = 22
        Width = 265
        Height = 21
        TabOrder = 0
      end
      object btnSearch: TButton
        Left = 368
        Top = 22
        Width = 75
        Height = 20
        Caption = 'Search'
        TabOrder = 1
        OnClick = btnSearchClick
      end
      object comboRegistry: TComboBox
        Left = 88
        Top = 56
        Width = 265
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
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
        Left = 16
        Top = 104
        Width = 633
        Height = 161
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
        TabOrder = 3
        ViewStyle = vsReport
        OnDblClick = ListView1DblClick
      end
      object Memo1: TMemo
        Left = 16
        Top = 256
        Width = 625
        Height = 169
        Lines.Strings = (
          'Memo1')
        TabOrder = 4
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Log'
      ImageIndex = 1
      object MemoLog: TMemo
        Left = 0
        Top = 0
        Width = 680
        Height = 425
        Align = alClient
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
