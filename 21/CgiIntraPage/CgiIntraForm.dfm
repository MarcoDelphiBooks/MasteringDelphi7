object formMain: TformMain
  Left = 0
  Top = 0
  Width = 449
  Height = 257
  Background.Fixed = False
  HandleTabs = False
  SupportedBrowsers = [brIE, brNetscape6, brOpera]
  TemplateProcessor = IWLayoutMgrHTML1
  AutoProcess = False
  PostToSelf = False
  DesignLeft = 476
  DesignTop = 191
  object IWButton1: TIWButton
    Left = 192
    Top = 56
    Width = 75
    Height = 25
    ZIndex = 0
    ButtonType = btButton
    Caption = 'IWButton1'
    Color = clBtnFace
    DoSubmitValidation = True
    Font.Color = clNone
    Font.Enabled = True
    Font.Size = 10
    Font.Style = []
    ScriptEvents = <>
    TabOrder = 0
    OnClick = IWButton1Click
  end
  object IWLabel1: TIWLabel
    Left = 112
    Top = 80
    Width = 62
    Height = 16
    ZIndex = 0
    Font.Color = clNone
    Font.Enabled = True
    Font.Size = 10
    Font.Style = []
    Caption = 'IWLabel1'
  end
  object IWComboBox1: TIWComboBox
    Left = 168
    Top = 128
    Width = 121
    Height = 21
    ZIndex = 0
    Font.Color = clNone
    Font.Enabled = True
    Font.Size = 10
    Font.Style = []
    ItemsHaveValues = False
    NoSelectionText = '-- No Selection --'
    RequireSelection = True
    ScriptEvents = <>
    UseSize = False
    DoSubmitValidation = True
    Editable = True
    TabOrder = 1
    ItemIndex = -1
    Items.Strings = (
      'one'
      'two'
      'three')
    Sorted = False
  end
  object IWLayoutMgrHTML1: TIWLayoutMgrHTML
    Enabled = True
    HTML.Strings = (
      '<HEAD>'
      '</HEAD><BODY><H2 align=center>Html Example code '
      
        '</H2><P align=left><FONT face=Arial><STRONG><EM><FONT face="Comi' +
        'c Sans MS">Font test</FONT> </EM></STRONG></FONT>'
      '</P><P> {%IWLabel1%} {%IWButton1%}'
      
        '</P><P class=xx>More text goes here, and you can type it directl' +
        'y... '
      '</P>'
      '<P class=xx>'
      '<TABLE cellSpacing=2 cellPadding=1 width="100%" border=1>'
      '<TBODY>'
      
        '<TR><TD width="100%">And finally we have some text and a combo b' +
        'ox within a grid... '
      
        '</TD><TD width="100%">{%IWComboBox1%}</TD></TR></TBODY></TABLE><' +
        '/P></BODY>')
    Left = 80
    Top = 112
  end
end
