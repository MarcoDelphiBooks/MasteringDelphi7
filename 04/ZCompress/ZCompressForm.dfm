object Form1: TForm1
  Left = 192
  Top = 107
  Width = 696
  Height = 479
  Caption = 'ZCompress'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    688
    452)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 24
    Width = 52
    Height = 13
    Caption = 'Orginal file:'
  end
  object Label2: TLabel
    Left = 8
    Top = 56
    Width = 77
    Height = 13
    Caption = 'Compressed file:'
  end
  object btnCompress: TButton
    Left = 24
    Top = 88
    Width = 97
    Height = 41
    Caption = 'Compress'
    TabOrder = 0
    OnClick = btnCompressClick
  end
  object btnDecompress: TButton
    Left = 24
    Top = 136
    Width = 97
    Height = 41
    Caption = 'Decompress'
    TabOrder = 1
    OnClick = btnDecompressClick
  end
  object Memo1: TMemo
    Left = 136
    Top = 88
    Width = 513
    Height = 337
    Anchors = [akLeft, akTop, akRight, akBottom]
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssBoth
    TabOrder = 2
  end
  object edOrigin: TEdit
    Left = 88
    Top = 21
    Width = 561
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 3
    Text = 'ZCompressForm.pas'
  end
  object edCompressed: TEdit
    Left = 88
    Top = 53
    Width = 561
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 4
    Text = 'ZCompressForm.zlib'
  end
end
