object _FrmBomba: T_FrmBomba
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  ClientHeight = 309
  ClientWidth = 374
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object gridBomba: TStringGrid
    Left = 0
    Top = 41
    Width = 374
    Height = 217
    Align = alCustom
    ColCount = 2
    RowCount = 2
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 374
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Bombas'
    Color = clAppWorkSpace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
    ExplicitLeft = 64
    ExplicitTop = 80
    ExplicitWidth = 185
  end
  object Button1: TButton
    Left = 8
    Top = 264
    Width = 97
    Height = 37
    Caption = 'Incluir'
    TabOrder = 2
    OnClick = Button1Click
  end
  object pnlCadBomba: TPanel
    Left = 8
    Top = 47
    Width = 353
    Height = 192
    TabOrder = 3
    Visible = False
    object Label1: TLabel
      Left = 35
      Top = 21
      Width = 27
      Height = 13
      Caption = 'Nome'
    end
    object Label2: TLabel
      Left = 35
      Top = 64
      Width = 36
      Height = 13
      Caption = 'Tanque'
    end
    object TxtNomeBomba: TEdit
      Left = 35
      Top = 40
      Width = 305
      Height = 21
      TabOrder = 0
    end
    object pnlRodapeCadastro: TPanel
      Left = 1
      Top = 131
      Width = 351
      Height = 60
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object BitBtn1: TBitBtn
        Left = 9
        Top = 16
        Width = 95
        Height = 33
        Caption = 'CONFIRMAR'
        TabOrder = 0
        OnClick = BitBtn1Click
      end
      object BitBtn2: TBitBtn
        Left = 117
        Top = 16
        Width = 84
        Height = 33
        Caption = 'FECHAR'
        TabOrder = 1
        OnClick = BitBtn2Click
      end
    end
    object TxtIdTanque: TEdit
      Left = 35
      Top = 83
      Width = 70
      Height = 21
      Enabled = False
      TabOrder = 2
      Text = '0'
    end
    object txtNomeTanque: TEdit
      Left = 111
      Top = 83
      Width = 186
      Height = 21
      Enabled = False
      TabOrder = 3
    end
    object BitBtn3: TBitBtn
      Left = 298
      Top = 81
      Width = 42
      Height = 25
      Caption = '...'
      TabOrder = 4
      OnClick = BitBtn3Click
    end
  end
end
