object Form1: TForm1
  Left = 204
  Top = 204
  Width = 664
  Height = 175
  Caption = 'BabelFish'
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
    Width = 465
    Height = 21
    TabOrder = 1
    Text = 'This is a sample message for an automatic translation'
  end
  object EditTarget: TEdit
    Left = 160
    Top = 72
    Width = 465
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
  object btnDirect: TButton
    Left = 40
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Direct'
    TabOrder = 4
    OnClick = btnDirectClick
  end
  object HTTPRIO1: THTTPRIO
    WSDLLocation = 'BabelFishService.xml'
    Service = 'BabelFish'
    Port = 'BabelFishPort'
    HTTPWebNode.Agent = 'Borland SOAP 1.1'
    HTTPWebNode.UseUTF8InHeader = False
    HTTPWebNode.InvokeOptions = [soIgnoreInvalidCerts]
    Converter.Options = [soSendMultiRefObj, soTryAllSchema]
    Left = 296
    Top = 72
  end
  object HTTPRIO2: THTTPRIO
    URL = 'http://services.xmethods.net:80/perl/soaplite.cgi'
    HTTPWebNode.Agent = 'Borland SOAP 1.2'
    HTTPWebNode.UseUTF8InHeader = False
    HTTPWebNode.InvokeOptions = [soIgnoreInvalidCerts, soAutoCheckAccessPointViaUDDI]
    Converter.Options = [soSendMultiRefObj, soTryAllSchema, soRootRefNodesToBody, soCacheMimeResponse, soUTF8EncodeXML]
    Left = 400
    Top = 72
  end
end
