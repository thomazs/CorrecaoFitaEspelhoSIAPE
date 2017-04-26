object Form1: TForm1
  Left = 192
  Top = 114
  Width = 674
  Height = 527
  Caption = 'Form1'
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
    Left = 16
    Top = 56
    Width = 36
    Height = 13
    Caption = 'Arquivo'
  end
  object Label2: TLabel
    Left = 16
    Top = 8
    Width = 19
    Height = 13
    Caption = 'Ano'
  end
  object Label3: TLabel
    Left = 160
    Top = 8
    Width = 20
    Height = 13
    Caption = 'M'#234's'
  end
  object Label4: TLabel
    Left = 432
    Top = 280
    Width = 71
    Height = 13
    Caption = #218'lt. Linha Lida:'
  end
  object lbLinha: TLabel
    Left = 512
    Top = 280
    Width = 3
    Height = 13
  end
  object Label5: TLabel
    Left = 432
    Top = 304
    Width = 75
    Height = 13
    Caption = #218'lt.Campo Lido:'
  end
  object lbUltCampo: TLabel
    Left = 520
    Top = 304
    Width = 3
    Height = 13
  end
  object Label6: TLabel
    Left = 424
    Top = 344
    Width = 32
    Height = 13
    Caption = 'Label6'
  end
  object edArquivo: TEdit
    Left = 16
    Top = 72
    Width = 601
    Height = 21
    TabOrder = 0
  end
  object btGetArquivo: TButton
    Left = 616
    Top = 70
    Width = 25
    Height = 25
    Caption = '...'
    TabOrder = 1
    OnClick = btGetArquivoClick
  end
  object btCarregar: TButton
    Left = 568
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Carregar'
    TabOrder = 2
    OnClick = btCarregarClick
  end
  object btSalvar: TButton
    Left = 488
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 3
    OnClick = btSalvarClick
  end
  object btImportar: TButton
    Left = 408
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Importar'
    TabOrder = 4
    OnClick = btImportarClick
  end
  object edAno: TEdit
    Left = 16
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 5
  end
  object edMes: TComboBox
    Left = 160
    Top = 24
    Width = 145
    Height = 22
    Style = csOwnerDrawFixed
    ItemHeight = 16
    TabOrder = 6
    Items.Strings = (
      'Janeiro'
      'Fevereiro'
      'Mar'#231'o'
      'Abril'
      'Maio'
      'Junho'
      'Julho'
      'Agosto'
      'Setembro'
      'Outubro'
      'Novembro'
      'Dezembro')
  end
  object sg_Campos: TStringGrid
    Left = 16
    Top = 104
    Width = 384
    Height = 361
    ColCount = 4
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 7
    ColWidths = (
      158
      80
      59
      64)
  end
  object Button1: TButton
    Left = 488
    Top = 144
    Width = 75
    Height = 25
    Caption = 'Salvar CFG'
    TabOrder = 8
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 568
    Top = 144
    Width = 75
    Height = 25
    Caption = 'Carregar CFG'
    TabOrder = 9
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 408
    Top = 144
    Width = 75
    Height = 25
    Caption = 'Log'
    TabOrder = 10
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 528
    Top = 176
    Width = 115
    Height = 25
    Caption = 'Lista de Registros'
    TabOrder = 11
    OnClick = Button4Click
  end
  object OPD: TOpenDialog
    Filter = 'Texto|*.TXT|Todos|*.*'
    Left = 504
    Top = 40
  end
  object Cds: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 472
    Top = 40
    object CdsMATR_EXTERNA: TIntegerField
      FieldName = 'MATR_EXTERNA'
    end
    object CdsDIGITO_VERIF: TIntegerField
      FieldName = 'DIGITO_VERIF'
    end
    object CdsNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object CdsANO: TIntegerField
      FieldName = 'ANO'
    end
    object CdsMES: TIntegerField
      FieldName = 'MES'
    end
    object CdsCPF: TStringField
      FieldName = 'CPF'
      Size = 11
    end
    object CdsPIS: TStringField
      FieldName = 'PIS'
      Size = 11
    end
    object CdsMAE: TStringField
      FieldName = 'MAE'
      Size = 50
    end
    object CdsSEXO: TStringField
      FieldName = 'SEXO'
      Size = 1
    end
    object CdsDTNASC: TDateField
      FieldName = 'DTNASC'
    end
    object CdsESTADOCIVIL: TStringField
      FieldName = 'ESTADOCIVIL'
      Size = 1
    end
    object CdsESCOLARIDADE: TStringField
      FieldName = 'ESCOLARIDADE'
      Size = 2
    end
    object CdsHABILITACAO: TStringField
      FieldName = 'HABILITACAO'
      Size = 3
    end
    object CdsPOSGRADUACAO: TStringField
      FieldName = 'POSGRADUACAO'
      Size = 4
    end
    object CdsNACIONALIDADE: TStringField
      FieldName = 'NACIONALIDADE'
      Size = 1
    end
    object CdsNATURALIDADE: TStringField
      FieldName = 'NATURALIDADE'
      Size = 2
    end
    object CdsPAIS: TStringField
      FieldName = 'PAIS'
      Size = 3
    end
    object CdsANOCHEGADA: TIntegerField
      FieldName = 'ANOCHEGADA'
    end
    object CdsDEP_IR: TIntegerField
      FieldName = 'DEP_IR'
    end
    object CdsDEP_SF: TIntegerField
      FieldName = 'DEP_SF'
    end
    object CdsDT_PRIM_EMP: TDateField
      FieldName = 'DT_PRIM_EMP'
    end
    object CdsID_ORIGEM: TIntegerField
      FieldName = 'ID_ORIGEM'
    end
    object CdsLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Size = 40
    end
    object CdsNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 6
    end
    object CdsCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 30
    end
    object CdsBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 30
    end
    object CdsMUNICIPIO: TStringField
      FieldName = 'MUNICIPIO'
      Size = 30
    end
    object CdsCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object CdsUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object CdsRGNUM: TStringField
      FieldName = 'RGNUM'
      Size = 14
    end
    object CdsRGORGAO: TStringField
      FieldName = 'RGORGAO'
      Size = 5
    end
    object CdsRGEXPEDICAO: TDateField
      FieldName = 'RGEXPEDICAO'
    end
    object CdsRGUF: TStringField
      FieldName = 'RGUF'
      Size = 2
    end
    object CdsTITULO: TStringField
      FieldName = 'TITULO'
      Size = 13
    end
  end
  object CG: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 568
    Top = 216
    object CGCAMPO: TStringField
      FieldName = 'CAMPO'
      Size = 50
    end
    object CGINICIO: TStringField
      FieldName = 'INICIO'
      Size = 10
    end
    object CGTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Size = 10
    end
    object CGTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
  end
end
