object Form1: TForm1
  Left = 204
  Top = 204
  Width = 719
  Height = 376
  Caption = 'BabelFishDebug'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnTranslate: TButton
    Left = 40
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Translate'
    TabOrder = 0
    OnClick = btnTranslateClick
  end
  object EditSource: TEdit
    Left = 160
    Top = 32
    Width = 513
    Height = 21
    TabOrder = 1
    Text = 'This is a sample message for an automatic translation'
  end
  object EditTarget: TEdit
    Left = 160
    Top = 72
    Width = 513
    Height = 21
    TabOrder = 2
  end
  object ComboBoxType: TComboBox
    Left = 40
    Top = 72
    Width = 81
    Height = 21
    ItemHeight = 13
    TabOrder = 3
    Text = 'en_it'
    Items.Strings = (
      'en_it'
      'en_fr'
      'en_de'
      'en_pt'
      'en_es')
  end
  object MemoRequest: TMemo
    Left = 40
    Top = 112
    Width = 313
    Height = 225
    Lines.Strings = (
      'MemoRequest')
    TabOrder = 4
  end
  object MemoResponse: TMemo
    Left = 360
    Top = 112
    Width = 313
    Height = 225
    Lines.Strings = (
      'MemoResponse')
    TabOrder = 5
  end
  object HTTPRIO1: THTTPRIO
    OnAfterExecute = HTTPRIO1AfterExecute
    OnBeforeExecute = HTTPRIO1BeforeExecute
    URL = 'http://services.xmethods.net/perl/soaplite.cgi'
    HTTPWebNode.Agent = 'Borland SOAP 1.1'
    HTTPWebNode.UseUTF8InHeader = False
    HTTPWebNode.InvokeOptions = [soIgnoreInvalidCerts]
    Converter.Options = [soSendMultiRefObj, soTryAllSchema]
    Left = 224
    Top = 64
  end
end
