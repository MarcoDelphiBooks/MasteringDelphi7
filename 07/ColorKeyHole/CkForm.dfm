object Form1: TForm1
  Left = 215
  Top = 148
  Width = 405
  Height = 239
  AlphaBlendValue = 200
  Caption = 'Color Key Hole'
  Color = clBtnFace
  TransparentColor = True
  TransparentColorValue = clGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Shape1: TShape
    Left = 195
    Top = 16
    Width = 181
    Height = 177
    Anchors = [akLeft, akTop, akRight, akBottom]
    Brush.Color = clGreen
    Pen.Style = psClear
    Pen.Width = 0
    Shape = stCircle
  end
  object Button1: TButton
    Left = 32
    Top = 32
    Width = 105
    Height = 25
    Caption = 'Alpha'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 32
    Top = 72
    Width = 105
    Height = 25
    Caption = 'Fade In Alpha'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 32
    Top = 112
    Width = 105
    Height = 25
    Caption = 'Fade In Plain'
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 32
    Top = 152
    Width = 105
    Height = 25
    Caption = 'Slide From Center'
    TabOrder = 3
    OnClick = Button4Click
  end
end
