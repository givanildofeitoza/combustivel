object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 112
  ClientWidth = 811
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn
    Left = 144
    Top = 48
    Width = 105
    Height = 41
    Caption = 'BOMBAS'
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 24
    Top = 48
    Width = 105
    Height = 41
    Caption = 'TANQUES'
    TabOrder = 1
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 255
    Top = 48
    Width = 116
    Height = 41
    Caption = 'ABASTECIMENTO'
    TabOrder = 2
    OnClick = BitBtn3Click
  end
  object BitBtn4: TBitBtn
    Left = 440
    Top = 48
    Width = 145
    Height = 41
    Caption = 'IMPRESS'#195'O'
    TabOrder = 3
    OnClick = BitBtn4Click
  end
  object qrPadrao: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = ConexaoSQLITE
    Left = 688
    Top = 64
  end
  object ConexaoSQLITE: TSQLConnection
    ConnectionName = 'SQLITECONNECTION'
    DriverName = 'Sqlite'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Sqlite'
      'Database=combustivel.db')
    Left = 648
    Top = 56
  end
end
