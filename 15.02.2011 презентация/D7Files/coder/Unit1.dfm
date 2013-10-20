object Form1: TForm1
  Left = 259
  Top = 228
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Coder'
  ClientHeight = 344
  ClientWidth = 616
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 304
    Width = 45
    Height = 13
    Caption = #1057#1076#1080#1074#1075' '#1085#1072
  end
  object Label2: TLabel
    Left = 160
    Top = 304
    Width = 53
    Height = 13
    Caption = #1089#1080#1084#1074#1086#1083#1086#1074'.'
  end
  object Button1: TButton
    Left = 256
    Top = 288
    Width = 129
    Height = 49
    Caption = #1047#1072#1082#1086#1076#1080#1088#1086#1074#1072#1090#1100'!'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 8
    Top = 8
    Width = 297
    Height = 273
    TabOrder = 1
  end
  object Memo2: TMemo
    Left = 320
    Top = 8
    Width = 289
    Height = 273
    Lines.Strings = (
      '')
    TabOrder = 2
  end
  object Edit1: TEdit
    Left = 80
    Top = 304
    Width = 73
    Height = 21
    TabOrder = 3
    Text = '1'
    OnChange = Edit1Change
  end
end
