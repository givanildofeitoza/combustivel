object _FrmTanque: T_FrmTanque
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  ClientHeight = 298
  ClientWidth = 378
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 378
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Tanques'
    Color = clAppWorkSpace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    ExplicitLeft = 64
    ExplicitTop = 80
    ExplicitWidth = 185
  end
  object gridTanque: TStringGrid
    Left = 0
    Top = 41
    Width = 378
    Height = 200
    Align = alCustom
    ColCount = 3
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    TabOrder = 1
    OnSelectCell = gridTanqueSelectCell
  end
  object btnIncluir: TButton
    Left = 8
    Top = 247
    Width = 97
    Height = 43
    Caption = 'INCLUIR'
    TabOrder = 2
    OnClick = btnIncluirClick
  end
  object pnlCadTanque: TPanel
    Left = 8
    Top = 49
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
      Width = 58
      Height = 13
      Caption = 'Combust'#237'vel'
    end
    object TxtNometANQUE: TEdit
      Left = 35
      Top = 40
      Width = 305
      Height = 21
      CharCase = ecUpperCase
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
    object CboCombustivel: TComboBox
      Left = 35
      Top = 83
      Width = 238
      Height = 21
      TabOrder = 2
      Text = 'GASOLINA'
      Items.Strings = (
        'GASOLINA'
        'DISEL')
    end
  end
  object btnSelecionar: TBitBtn
    Left = 273
    Top = 247
    Width = 97
    Height = 43
    Caption = 'SELECIONAR'
    TabOrder = 4
    Visible = False
    OnClick = btnSelecionarClick
  end
end
