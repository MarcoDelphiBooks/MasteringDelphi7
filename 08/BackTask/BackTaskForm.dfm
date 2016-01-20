object Form1: TForm1
  Left = 206
  Top = 147
  Width = 486
  Height = 253
  HorzScrollBar.Range = 465
  VertScrollBar.Range = 89
  ActiveControl = Button1
  AutoScroll = False
  Caption = 'BackTask'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object ProgressBar1: TProgressBar
    Left = 24
    Top = 64
    Width = 441
    Height = 25
    TabOrder = 2
  end
  object Button1: TButton
    Left = 24
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Plain'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 112
    Top = 24
    Width = 75
    Height = 25
    Caption = 'App.ProcMsg'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 200
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Thread'
    TabOrder = 3
    OnClick = Button3Click
  end
end
