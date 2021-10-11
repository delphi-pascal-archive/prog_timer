object Form1: TForm1
  Left = 257
  Top = 125
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'ProgTimer'
  ClientHeight = 125
  ClientWidth = 370
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 16
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 187
    Height = 16
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1086#1082#1085#1072' '#1087#1088#1086#1075#1088#1072#1084#1084#1099':'
  end
  object Label2: TLabel
    Left = 8
    Top = 48
    Width = 203
    Height = 16
    Caption = #1055#1086#1083#1091#1095#1080#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1074' '#1092#1086#1088#1084#1072#1090#1077':'
  end
  object SpeedButton1: TSpeedButton
    Left = 264
    Top = 72
    Width = 97
    Height = 25
    Caption = #1053#1072#1095#1072#1090#1100
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 160
    Top = 72
    Width = 97
    Height = 25
    Caption = #1055#1088#1077#1088#1074#1072#1090#1100
    Enabled = False
    OnClick = SpeedButton2Click
  end
  object ComboBox1: TComboBox
    Left = 224
    Top = 39
    Width = 137
    Height = 24
    ItemHeight = 16
    TabOrder = 1
    Text = #1052#1080#1083#1083#1080#1089#1077#1082#1091#1085#1076#1099
    Items.Strings = (
      #1052#1080#1083#1083#1080#1089#1077#1082#1091#1085#1076#1099
      #1057#1077#1082#1091#1085#1076#1099
      #1052#1080#1085#1091#1090#1099
      #1063#1072#1089#1099)
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 106
    Width = 370
    Height = 19
    Panels = <
      item
        Width = 250
      end>
  end
  object ComboBox2: TComboBox
    Left = 224
    Top = 8
    Width = 137
    Height = 24
    ItemHeight = 16
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
  end
  object XPManifest1: TXPManifest
    Left = 16
    Top = 72
  end
  object MainMenu1: TMainMenu
    Left = 48
    Top = 72
    object N1: TMenuItem
      Caption = #1060#1072#1081#1083
      object N5: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = N5Click
      end
    end
    object N2: TMenuItem
      Caption = #1055#1086#1084#1086#1097#1100
      object N3: TMenuItem
        Caption = #1057#1087#1088#1072#1074#1082#1072
      end
      object N4: TMenuItem
        Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077'...'
        OnClick = N4Click
      end
    end
  end
end
