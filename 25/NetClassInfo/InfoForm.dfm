object Form1: TForm1
  Left = 217
  Top = 109
  Width = 397
  Height = 236
  Caption = 'Class Info'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 8
    Top = 8
    Width = 56
    Height = 13
    Caption = 'Class Name'
  end
  object Panel1: TPanel
    Left = 168
    Top = 8
    Width = 209
    Height = 193
    Caption = 'Panel1'
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 48
      Width = 63
      Height = 13
      Caption = 'Base Classes'
    end
    object Label2: TLabel
      Left = 8
      Top = 8
      Width = 25
      Height = 13
      Caption = 'Class'
    end
    object ListParent: TListBox
      Left = 8
      Top = 64
      Width = 193
      Height = 121
      ItemHeight = 13
      TabOrder = 0
    end
    object EditInfo: TEdit
      Left = 8
      Top = 24
      Width = 193
      Height = 21
      ReadOnly = True
      TabOrder = 1
    end
  end
  object ListClasses: TListBox
    Left = 8
    Top = 24
    Width = 153
    Height = 177
    ItemHeight = 13
    TabOrder = 1
    OnClick = ListClassesClick
  end
end
