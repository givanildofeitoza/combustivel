object _FrmAbastecimento: T_FrmAbastecimento
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  ClientHeight = 304
  ClientWidth = 621
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 64
    Width = 120
    Height = 16
    Caption = 'Selecione a Bomba'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 24
    Top = 128
    Width = 115
    Height = 16
    Caption = 'Quantidade Litros'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 168
    Top = 128
    Width = 71
    Height = 16
    Caption = 'Imposto %'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 304
    Top = 128
    Width = 91
    Height = 16
    Caption = 'Pre'#231'o Unit'#225'rio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 621
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Abastecimento'
    Color = clAppWorkSpace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 4
  end
  object TxtIdBomba: TEdit
    Left = 24
    Top = 86
    Width = 65
    Height = 21
    Enabled = False
    TabOrder = 5
  end
  object txtNomeBomba: TEdit
    Left = 95
    Top = 86
    Width = 218
    Height = 21
    Enabled = False
    TabOrder = 6
  end
  object BitBtn1: TBitBtn
    Left = 319
    Top = 84
    Width = 50
    Height = 25
    Caption = '...'
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object TxtqtdLitrosAbastecer: TEdit
    Left = 24
    Top = 150
    Width = 121
    Height = 21
    TabOrder = 1
    Text = '0.00'
    OnKeyPress = TxtqtdLitrosAbastecerKeyPress
  end
  object txtAliquota: TEdit
    Left = 168
    Top = 150
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 7
    Text = '13.00'
  end
  object txtPrecoUnitario: TEdit
    Left = 304
    Top = 150
    Width = 121
    Height = 21
    TabOrder = 2
    Text = '2.85'
    OnKeyPress = txtPrecoUnitarioKeyPress
  end
  object Panel2: TPanel
    Left = 0
    Top = 264
    Width = 621
    Height = 40
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 8
    object Label5: TLabel
      Left = 224
      Top = 12
      Width = 112
      Height = 16
      Caption = 'Total a Pagar R$:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object TxtTotal: TEdit
      Left = 359
      Top = 0
      Width = 262
      Height = 40
      Align = alRight
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      Text = '0.00'
      ExplicitHeight = 33
    end
  end
  object BitBtn2: TBitBtn
    Left = 24
    Top = 188
    Width = 265
    Height = 37
    Caption = 'Confirmar Abastecimento'
    TabOrder = 3
    OnClick = BitBtn2Click
    OnEnter = BitBtn2Enter
  end
end
