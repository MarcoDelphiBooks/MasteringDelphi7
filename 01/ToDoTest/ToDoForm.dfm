object Form1: TForm1
  Left = 222
  Top = 200
  Width = 455
  Height = 186
  Caption = 'ToDo Test'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 56
    Width = 197
    Height = 26
    Caption = 
      'This program does nothing, but its source code has many To-Do co' +
      'mments!'
    WordWrap = True
  end
  object Button1: TButton
    Left = 296
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
end
