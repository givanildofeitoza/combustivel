object _FrmRelatorio: T_FrmRelatorio
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio de abastecimento'
  ClientHeight = 857
  ClientWidth = 806
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object RLReport1: TRLReport
    Left = 8
    Top = 0
    Width = 794
    Height = 1123
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 103
      BandType = btColumnHeader
      object RLLabel1: TRLLabel
        Left = 206
        Top = 16
        Width = 224
        Height = 16
        Caption = 'RELAT'#211'RIO DE ABASTECIMENTOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel9: TRLLabel
        Left = 286
        Top = 38
        Width = 67
        Height = 16
        Caption = 'PER'#205'ODO:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object labelData1: TRLLabel
        Left = 233
        Top = 60
        Width = 65
        Height = 16
        Caption = '/  /'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LabelData2: TRLLabel
        Left = 340
        Top = 60
        Width = 67
        Height = 16
        Caption = '/ /'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel12: TRLLabel
        Left = 304
        Top = 60
        Width = 12
        Height = 16
        Caption = 'E'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 173
      Width = 718
      Height = 28
      object RLDBText1: TRLDBText
        Left = 22
        Top = 5
        Width = 49
        Height = 16
        DataField = 'ID'
        DataSource = DataSource1
        Text = ''
      end
      object RLDBText2: TRLDBText
        Left = 102
        Top = 5
        Width = 38
        Height = 16
        DataField = 'DATA'
        DataSource = DataSource1
        Text = ''
      end
      object RLDBText3: TRLDBText
        Left = 184
        Top = 5
        Width = 48
        Height = 16
        DataField = 'VALOR'
        DataSource = DataSource1
        Text = ''
      end
      object RLDBText4: TRLDBText
        Left = 344
        Top = 5
        Width = 63
        Height = 16
        DataField = 'IMPOSTO'
        DataSource = DataSource1
        Text = ''
      end
      object RLDBText5: TRLDBText
        Left = 435
        Top = 5
        Width = 91
        Height = 16
        DataField = 'NOMEBOMBA'
        DataSource = DataSource1
        Text = ''
      end
      object RLDBText6: TRLDBText
        Left = 587
        Top = 5
        Width = 96
        Height = 16
        DataField = 'COMBUSTIVEL'
        DataSource = DataSource1
        Text = ''
      end
      object RLDBText7: TRLDBText
        Left = 264
        Top = 5
        Width = 49
        Height = 16
        DataField = 'LITROS'
        DataSource = DataSource1
        Text = ''
      end
    end
    object RLBand3: TRLBand
      Left = 38
      Top = 141
      Width = 718
      Height = 32
      BandType = btColumnHeader
      object RLLabel2: TRLLabel
        Left = 22
        Top = 13
        Width = 17
        Height = 16
        Caption = 'ID'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel3: TRLLabel
        Left = 102
        Top = 10
        Width = 39
        Height = 16
        Caption = 'DATA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel4: TRLLabel
        Left = 184
        Top = 10
        Width = 69
        Height = 16
        Caption = 'VALOR R$'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel5: TRLLabel
        Left = 344
        Top = 10
        Width = 65
        Height = 16
        Caption = 'IMPOSTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel6: TRLLabel
        Left = 264
        Top = 10
        Width = 52
        Height = 16
        Caption = 'LITROS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel7: TRLLabel
        Left = 435
        Top = 10
        Width = 52
        Height = 16
        Caption = 'BOMBA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel8: TRLLabel
        Left = 587
        Top = 10
        Width = 98
        Height = 16
        Caption = 'COMBUST'#205'VEL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLBand4: TRLBand
      Left = 38
      Top = 201
      Width = 718
      Height = 120
      BandType = btColumnFooter
      object RLLabel10: TRLLabel
        Left = 22
        Top = 93
        Width = 206
        Height = 16
        Caption = 'QTD TOTAL ABASTECIMENTOS:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel11: TRLLabel
        Left = 381
        Top = 93
        Width = 120
        Height = 16
        Caption = 'VALOR TOTAL R$:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblQtdTotal: TRLLabel
        Left = 243
        Top = 93
        Width = 29
        Height = 16
        Caption = '0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblSomaToal: TRLLabel
        Left = 526
        Top = 93
        Width = 29
        Height = 16
        Caption = '0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel13: TRLLabel
        Left = 22
        Top = 49
        Width = 56
        Height = 16
        Caption = 'LITROS:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel14: TRLLabel
        Left = 22
        Top = 71
        Width = 64
        Height = 16
        Caption = 'Gasolina:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel15: TRLLabel
        Left = 163
        Top = 71
        Width = 39
        Height = 16
        Caption = 'Disel:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblGas: TRLLabel
        Left = 92
        Top = 71
        Width = 29
        Height = 16
        Caption = '0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblDisel: TRLLabel
        Left = 208
        Top = 71
        Width = 29
        Height = 16
        Caption = '0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel16: TRLLabel
        Left = 304
        Top = 25
        Width = 112
        Height = 16
        Caption = 'TOTALIZADORES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 582
    Top = 401
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 358
    Top = 425
    object ClientDataSet1VALOR: TFloatField
      FieldName = 'VALOR'
    end
    object ClientDataSet1IMPOSTO: TFloatField
      FieldName = 'IMPOSTO'
    end
    object ClientDataSet1LITROS: TFloatField
      FieldName = 'LITROS'
    end
    object ClientDataSet1NOMEBOMBA: TWideMemoField
      FieldName = 'NOMEBOMBA'
      BlobType = ftWideMemo
    end
    object ClientDataSet1COMBUSTIVEL: TWideMemoField
      FieldName = 'COMBUSTIVEL'
      BlobType = ftWideMemo
    end
    object ClientDataSet1ID: TIntegerField
      FieldName = 'ID'
    end
    object ClientDataSet1DATA: TDateField
      FieldName = 'DATA'
    end
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = FDQrpadrao
    Left = 358
    Top = 481
  end
  object ConexaoDACRel: TFDConnection
    Params.Strings = (
      
        'Database=C:\givanildo\Projetos\COMBUSTIVEL\Win32\Debug\combustiv' +
        'el.db'
      'DriverID=SQLite')
    Left = 576
    Top = 528
  end
  object FDQrpadrao: TFDQuery
    Connection = ConexaoDACRel
    Left = 576
    Top = 464
  end
end
