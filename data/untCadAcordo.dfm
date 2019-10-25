object FrmAcordo: TFrmAcordo
  Left = 276
  Top = 157
  Width = 855
  Height = 624
  BorderIcons = []
  Caption = 'Acordo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 22
    Top = 16
    Width = 49
    Height = 13
    Caption = 'N'#186' Acordo'
    FocusControl = DBEditNumeroAcordo
  end
  object Label2: TLabel
    Left = 182
    Top = 16
    Width = 74
    Height = 13
    Caption = 'Data assinatura'
  end
  object Label20: TLabel
    Left = 582
    Top = 16
    Width = 58
    Height = 13
    Caption = 'Observa'#231#227'o'
  end
  object Label25: TLabel
    Left = 131
    Top = 104
    Width = 67
    Height = 13
    Caption = 'Taxa de Juros'
  end
  object Label26: TLabel
    Left = 462
    Top = 104
    Width = 64
    Height = 13
    Caption = 'Periodicidade'
  end
  object Label27: TLabel
    Left = 22
    Top = 56
    Width = 56
    Height = 13
    Caption = 'N'#186' Parcelas'
    FocusControl = DBEditNumParcelas
  end
  object Label28: TLabel
    Left = 406
    Top = 56
    Width = 64
    Height = 13
    Caption = 'Valor Entrada'
  end
  object Label29: TLabel
    Left = 102
    Top = 56
    Width = 62
    Height = 13
    Caption = 'Valor parcela'
  end
  object Label30: TLabel
    Left = 254
    Top = 56
    Width = 105
    Height = 13
    Caption = 'Vencimento1'#186' Parcela'
  end
  object Label31: TLabel
    Left = 22
    Top = 104
    Width = 76
    Height = 13
    Caption = 'Valor honorarios'
  end
  object Label32: TLabel
    Left = 361
    Top = 104
    Width = 74
    Height = 13
    Caption = 'Taxa refer'#234'ncia'
  end
  object Label35: TLabel
    Left = 222
    Top = 104
    Width = 94
    Height = 13
    Caption = 'Meio de pagamento'
  end
  object Label37: TLabel
    Left = 310
    Top = 16
    Width = 102
    Height = 13
    Caption = 'Valor Total do acordo'
  end
  object Label41: TLabel
    Left = 454
    Top = 16
    Width = 82
    Height = 13
    Caption = 'Valor confessado'
  end
  object DBEditNumeroAcordo: TDBEdit
    Left = 22
    Top = 32
    Width = 147
    Height = 21
    CharCase = ecUpperCase
    DataField = 'NumeroAcordo'
    DataSource = DM.DsAcordo
    TabOrder = 0
  end
  object DBEditNumParcelas: TDBEdit
    Left = 22
    Top = 72
    Width = 67
    Height = 21
    CharCase = ecUpperCase
    DataField = 'QuantidadeParcelas'
    DataSource = DM.DsAcordo
    TabOrder = 4
  end
  object DBEditTaxaRef: TDBComboBox
    Left = 361
    Top = 120
    Width = 96
    Height = 21
    DataField = 'TaxaReferencia'
    DataSource = DM.DsAcordo
    ItemHeight = 13
    Items.Strings = (
      'SIM'
      'N'#195'O')
    TabOrder = 11
  end
  object DBMemoObs: TDBMemo
    Left = 584
    Top = 34
    Width = 227
    Height = 111
    DataField = 'Observacao'
    DataSource = DM.DsAcordo
    TabOrder = 13
  end
  object PageControl1: TPageControl
    Left = 22
    Top = 160
    Width = 790
    Height = 377
    ActivePage = TabSheet1
    TabOrder = 14
    object TabSheet1: TTabSheet
      Caption = 'Pend'#234'ncias'
      object GroupBox4: TGroupBox
        Left = 0
        Top = 0
        Width = 782
        Height = 349
        Align = alClient
        TabOrder = 0
        object DBGrid1: TDBGrid
          Left = 16
          Top = 88
          Width = 753
          Height = 233
          DataSource = DM.DsPendencia
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = DBGrid1DblClick
          Columns = <
            item
              Expanded = False
              FieldName = 'NumeroContrato'
              Title.Caption = 'N'#186' Contrato'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NumeroCarteira'
              Title.Caption = 'N'#186' Carteira'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DataVencimento'
              Title.Caption = 'Data Vencimento'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UltimaParcelaPaga'
              Title.Caption = 'N'#186' '#218'ltima parcela paga'
              Width = 130
              Visible = True
            end>
        end
        object Panel1: TPanel
          Left = 16
          Top = 16
          Width = 753
          Height = 65
          TabOrder = 1
          object Label21: TLabel
            Left = 10
            Top = 16
            Width = 55
            Height = 13
            Caption = 'N'#186' Contrato'
            FocusControl = DBEditNumContrato
          end
          object Label22: TLabel
            Left = 146
            Top = 15
            Width = 51
            Height = 13
            Caption = 'N'#186' Carteira'
            FocusControl = DBEditNumCarteira
          end
          object Label23: TLabel
            Left = 234
            Top = 15
            Width = 96
            Height = 13
            Caption = 'Data de vencimento'
          end
          object Label24: TLabel
            Left = 379
            Top = 15
            Width = 109
            Height = 13
            Caption = 'N'#186' '#218'ltima parcela paga'
            FocusControl = DBEditUltimoPagamento
          end
          object DBEditNumContrato: TDBEdit
            Left = 10
            Top = 31
            Width = 121
            Height = 21
            DataField = 'NumeroContrato'
            DataSource = DM.DsPendencia
            TabOrder = 0
          end
          object DBEditNumCarteira: TDBEdit
            Left = 146
            Top = 31
            Width = 69
            Height = 21
            DataField = 'NumeroCarteira'
            DataSource = DM.DsPendencia
            TabOrder = 1
          end
          object DBEditUltimoPagamento: TDBEdit
            Left = 380
            Top = 31
            Width = 123
            Height = 21
            DataField = 'UltimaParcelaPaga'
            DataSource = DM.DsPendencia
            TabOrder = 3
          end
          object DBEditVencimento: TDBDateEdit
            Left = 235
            Top = 30
            Width = 136
            Height = 21
            DataField = 'DataVencimento'
            DataSource = DM.DsPendencia
            CheckOnExit = True
            DialogTitle = 'Escolha a data'
            NumGlyphs = 2
            TabOrder = 2
            YearDigits = dyFour
          end
          object ButtonAdicionarPendencia: TButton
            Left = 514
            Top = 28
            Width = 75
            Height = 25
            Caption = 'Adicionar'
            TabOrder = 4
            OnClick = ButtonAdicionarPendenciaClick
          end
          object ButtonSalvarPendencia: TButton
            Left = 594
            Top = 28
            Width = 75
            Height = 25
            Caption = 'Salvar'
            TabOrder = 5
            OnClick = ButtonSalvarPendenciaClick
          end
          object ButtonApagarPendencia: TButton
            Left = 672
            Top = 28
            Width = 75
            Height = 25
            Caption = 'Apagar'
            TabOrder = 6
            OnClick = ButtonApagarPendenciaClick
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Dados do devedor'
      ImageIndex = 1
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 782
        Height = 349
        Align = alClient
        TabOrder = 0
        object Label3: TLabel
          Left = 157
          Top = 23
          Width = 28
          Height = 13
          Caption = 'Nome'
          FocusControl = DBEditNomeCliente
        end
        object Label13: TLabel
          Left = 21
          Top = 23
          Width = 52
          Height = 13
          Caption = 'CPF/CNPJ'
          FocusControl = DBEditCpfCnpjCliente
        end
        object Label36: TLabel
          Left = 488
          Top = 24
          Width = 59
          Height = 13
          Caption = 'Tipo Pessoa'
        end
        object Label33: TLabel
          Left = 21
          Top = 67
          Width = 68
          Height = 13
          Caption = 'N'#250'mero Conta'
          FocusControl = DBEditNumContaCliente
        end
        object Label34: TLabel
          Left = 157
          Top = 67
          Width = 39
          Height = 13
          Caption = 'Ag'#234'ncia'
          FocusControl = DBEditNumAgenciaCliente
        end
        object DBEditNomeCliente: TDBEdit
          Left = 157
          Top = 40
          Width = 316
          Height = 21
          CharCase = ecUpperCase
          DataField = 'NomeCliente'
          DataSource = DM.DsAcordo
          TabOrder = 1
        end
        object DBEditCpfCnpjCliente: TDBEdit
          Left = 21
          Top = 40
          Width = 121
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CpfCnpjCliente'
          DataSource = DM.DsAcordo
          TabOrder = 0
        end
        object GroupBoxEndereco: TGroupBox
          Left = 20
          Top = 116
          Width = 527
          Height = 221
          Caption = 'Endere'#231'o '
          TabOrder = 5
          object Label4: TLabel
            Left = 8
            Top = 24
            Width = 54
            Height = 13
            Caption = 'Logradouro'
            FocusControl = DBEditLogradouroCliente
          end
          object Label5: TLabel
            Left = 280
            Top = 24
            Width = 37
            Height = 13
            Caption = 'N'#250'mero'
            FocusControl = DBEditNumeroEnderecoCliente
          end
          object Label6: TLabel
            Left = 8
            Top = 120
            Width = 64
            Height = 13
            Caption = 'Complemento'
            FocusControl = DBEditComplementoEnderecoCliente
          end
          object Label7: TLabel
            Left = 8
            Top = 72
            Width = 27
            Height = 13
            Caption = 'Bairro'
            FocusControl = DBEditBairroEnderecoCliente
          end
          object Label8: TLabel
            Left = 280
            Top = 72
            Width = 45
            Height = 13
            Caption = 'Municipio'
            FocusControl = DBEditMunicipioEnderecoCliente
          end
          object Label9: TLabel
            Left = 440
            Top = 72
            Width = 14
            Height = 13
            Caption = 'UF'
          end
          object Label10: TLabel
            Left = 399
            Top = 24
            Width = 21
            Height = 13
            Caption = 'CEP'
            FocusControl = DBEditCepEnderecoCliente
          end
          object Label11: TLabel
            Left = 8
            Top = 166
            Width = 24
            Height = 13
            Caption = 'DDD'
            FocusControl = DBEditDDDCliente
          end
          object Label12: TLabel
            Left = 79
            Top = 167
            Width = 42
            Height = 13
            Caption = 'Telefone'
            FocusControl = DBEditTelefoneCliente
          end
          object DBEditLogradouroCliente: TDBEdit
            Left = 8
            Top = 40
            Width = 265
            Height = 21
            CharCase = ecUpperCase
            DataField = 'EnderecoCliente'
            DataSource = DM.DsAcordo
            TabOrder = 0
          end
          object DBEditNumeroEnderecoCliente: TDBEdit
            Left = 280
            Top = 40
            Width = 108
            Height = 21
            CharCase = ecUpperCase
            DataField = 'NumeroEnderecoCliente'
            DataSource = DM.DsAcordo
            TabOrder = 1
          end
          object DBEditComplementoEnderecoCliente: TDBEdit
            Left = 8
            Top = 136
            Width = 497
            Height = 21
            CharCase = ecUpperCase
            DataField = 'ComplementoEnderecoCliente'
            DataSource = DM.DsAcordo
            TabOrder = 6
          end
          object DBEditBairroEnderecoCliente: TDBEdit
            Left = 8
            Top = 88
            Width = 264
            Height = 21
            CharCase = ecUpperCase
            DataField = 'BairroCliente'
            DataSource = DM.DsAcordo
            TabOrder = 3
          end
          object DBEditMunicipioEnderecoCliente: TDBEdit
            Left = 277
            Top = 88
            Width = 148
            Height = 21
            CharCase = ecUpperCase
            DataField = 'MunicipioCliente'
            DataSource = DM.DsAcordo
            TabOrder = 4
          end
          object DBEditCepEnderecoCliente: TDBEdit
            Left = 399
            Top = 40
            Width = 108
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CepCliente'
            DataSource = DM.DsAcordo
            TabOrder = 2
          end
          object DBEditDDDCliente: TDBEdit
            Left = 8
            Top = 185
            Width = 56
            Height = 21
            CharCase = ecUpperCase
            DataField = 'DDDCliente'
            DataSource = DM.DsAcordo
            TabOrder = 7
          end
          object DBEditUfEnderecoCliente: TDBComboBox
            Left = 440
            Top = 86
            Width = 65
            Height = 21
            CharCase = ecUpperCase
            DataField = 'UFCliente'
            DataSource = DM.DsAcordo
            ItemHeight = 13
            Items.Strings = (
              'AC'
              'AL'
              'AM'
              'AP'
              'BA'
              'CE'
              'DF'
              'ES'
              'GO'
              'MA'
              'MG'
              'MS'
              'MT'
              'PA'
              'PB'
              'PE'
              'PI'
              'PR'
              'RJ'
              'RN'
              'RO'
              'RR'
              'RS'
              'SC'
              'SE'
              'SP'
              'TO')
            TabOrder = 5
          end
          object DBEditTelefoneCliente: TDBEdit
            Left = 79
            Top = 185
            Width = 121
            Height = 21
            CharCase = ecUpperCase
            DataField = 'TelefoneCliente'
            DataSource = DM.DsAcordo
            TabOrder = 8
          end
        end
        object DBEditNumContaCliente: TDBEdit
          Left = 21
          Top = 83
          Width = 124
          Height = 21
          CharCase = ecUpperCase
          DataField = 'NumeroContaCliente'
          DataSource = DM.DsAcordo
          TabOrder = 3
        end
        object DBEditNumAgenciaCliente: TDBEdit
          Left = 157
          Top = 83
          Width = 148
          Height = 21
          CharCase = ecUpperCase
          DataField = 'NumeroAgenciaCliente'
          DataSource = DM.DsAcordo
          TabOrder = 4
        end
        object DBEditTipoPessoaCliente: TDBComboBox
          Left = 488
          Top = 40
          Width = 155
          Height = 21
          DataField = 'FilialCpfCnpjCliente'
          DataSource = DM.DsAcordo
          ItemHeight = 13
          Items.Strings = (
            '0000 - Pessoa F'#237'sica'
            '0001 - Pessoa Juridica')
          TabOrder = 2
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Avalistas'
      ImageIndex = 2
      object GroupBox3: TGroupBox
        Left = 0
        Top = 0
        Width = 782
        Height = 349
        Align = alClient
        TabOrder = 0
        object Label14: TLabel
          Left = 22
          Top = 24
          Width = 77
          Height = 13
          Caption = 'Nome Avalista 1'
          FocusControl = DBEditNomeAvalista1
        end
        object Label15: TLabel
          Left = 22
          Top = 64
          Width = 77
          Height = 13
          Caption = 'Nome Avalista 2'
          FocusControl = DBEditNomeAvalista2
        end
        object Label16: TLabel
          Left = 342
          Top = 24
          Width = 52
          Height = 13
          Caption = 'CPF/CNPJ'
          FocusControl = DBEditCpfAvalista1
        end
        object Label17: TLabel
          Left = 494
          Top = 24
          Width = 106
          Height = 13
          Caption = 'Tipo pessoa avalista 1'
          Visible = False
        end
        object Label18: TLabel
          Left = 342
          Top = 64
          Width = 52
          Height = 13
          Caption = 'CPF/CNPJ'
          FocusControl = DBEditCpfAvalista2
        end
        object Label19: TLabel
          Left = 494
          Top = 64
          Width = 106
          Height = 13
          Caption = 'Tipo pessoa avalista 2'
          Visible = False
        end
        object DBEditNomeAvalista1: TDBEdit
          Left = 22
          Top = 40
          Width = 300
          Height = 21
          CharCase = ecUpperCase
          DataField = 'NomeAvalista1'
          DataSource = DM.DsAcordo
          TabOrder = 0
        end
        object DBEditNomeAvalista2: TDBEdit
          Left = 22
          Top = 78
          Width = 300
          Height = 21
          CharCase = ecUpperCase
          DataField = 'NomeAvalista2'
          DataSource = DM.DsAcordo
          TabOrder = 3
        end
        object DBEditCpfAvalista1: TDBEdit
          Left = 342
          Top = 40
          Width = 147
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CpfCnpjAvalista1'
          DataSource = DM.DsAcordo
          TabOrder = 1
        end
        object DBEditCpfAvalista2: TDBEdit
          Left = 342
          Top = 78
          Width = 147
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CpfCnpjAvalista2'
          DataSource = DM.DsAcordo
          TabOrder = 4
        end
        object DBEditTipoAvalista2: TDBComboBox
          Left = 494
          Top = 78
          Width = 155
          Height = 21
          DataField = 'FilialAvalista2'
          DataSource = DM.DsAcordo
          ItemHeight = 13
          Items.Strings = (
            '0000 - Pessoa F'#237'sica'
            '0001 - Pessoa Juridica')
          TabOrder = 5
        end
        object DBEditTipoAvalista1: TDBComboBox
          Left = 494
          Top = 40
          Width = 155
          Height = 21
          DataField = 'FilialAvalista1'
          DataSource = DM.DsAcordo
          ItemHeight = 13
          Items.Strings = (
            '0000 - Pessoa F'#237'sica'
            '0001 - Pessoa Juridica')
          TabOrder = 2
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Aprova'#231#227'o DRC'
      ImageIndex = 3
      object GroupBox5: TGroupBox
        Left = 0
        Top = 0
        Width = 782
        Height = 349
        Align = alClient
        TabOrder = 0
        object Label38: TLabel
          Left = 24
          Top = 24
          Width = 131
          Height = 13
          Caption = 'Acordo aprovado pelo DRC'
        end
        object Label39: TLabel
          Left = 184
          Top = 24
          Width = 77
          Height = 13
          Caption = 'Data aprova'#231#227'o'
        end
        object Label40: TLabel
          Left = 328
          Top = 24
          Width = 237
          Height = 13
          Caption = 'Nome do operador do DRC que aprovou o acordo'
          FocusControl = DBEditNomeOperadorDRC
        end
        object DBEditNomeOperadorDRC: TDBEdit
          Left = 328
          Top = 40
          Width = 425
          Height = 21
          CharCase = ecUpperCase
          DataField = 'DrcNomeOperadorAprovacao'
          DataSource = DM.DsAcordo
          TabOrder = 2
        end
        object DBEditAprovadoDRC: TDBComboBox
          Left = 22
          Top = 40
          Width = 147
          Height = 21
          DataField = 'DrcAcordoAprovado'
          DataSource = DM.DsAcordo
          ItemHeight = 13
          Items.Strings = (
            'SIM'
            'N'#195'O')
          TabOrder = 0
        end
        object DBEditDtaAprovacaoDRC: TDBDateEdit
          Left = 182
          Top = 40
          Width = 128
          Height = 21
          DataField = 'DrcDataAprovacaoAcordo'
          DataSource = DM.DsAcordo
          CheckOnExit = True
          DialogTitle = 'Escolha a data'
          NumGlyphs = 2
          TabOrder = 1
          YearDigits = dyFour
        end
      end
    end
  end
  object ButtonSalvarAcordo: TButton
    Left = 628
    Top = 547
    Width = 90
    Height = 25
    Caption = 'Salvar'
    TabOrder = 15
    OnClick = ButtonSalvarAcordoClick
  end
  object ButtonCancelarAcordo: TButton
    Left = 724
    Top = 547
    Width = 90
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 16
    OnClick = ButtonCancelarAcordoClick
  end
  object DBEditAssinatura: TDBDateEdit
    Left = 182
    Top = 32
    Width = 115
    Height = 21
    DataField = 'DataAcordo'
    DataSource = DM.DsAcordo
    CheckOnExit = True
    DefaultToday = True
    DialogTitle = 'Escolha a data'
    NumGlyphs = 2
    TabOrder = 1
    YearDigits = dyFour
  end
  object DBEdit1Vencimento: TDBDateEdit
    Left = 254
    Top = 72
    Width = 131
    Height = 21
    DataField = 'DataVencimento1ParcelaAcordo'
    DataSource = DM.DsAcordo
    CheckOnExit = True
    DialogTitle = 'Escolha a data'
    NumGlyphs = 2
    TabOrder = 6
    YearDigits = dyFour
  end
  object DBEditValorAcordo: TRxDBCalcEdit
    Left = 312
    Top = 32
    Width = 137
    Height = 21
    DataField = 'ValorTotalAcordo'
    DataSource = DM.DsAcordo
    DisplayFormat = '###,###,###,###,##0.00'
    FormatOnEditing = True
    NumGlyphs = 2
    TabOrder = 2
    ZeroEmpty = False
  end
  object DBEditValorParcela: TRxDBCalcEdit
    Left = 102
    Top = 73
    Width = 137
    Height = 21
    DataField = 'ValorParcelaAcordo'
    DataSource = DM.DsAcordo
    DisplayFormat = '###,###,###,###,##0.00'
    FormatOnEditing = True
    NumGlyphs = 2
    TabOrder = 5
    ZeroEmpty = False
  end
  object DBEditHonorario: TRxDBCalcEdit
    Left = 22
    Top = 120
    Width = 99
    Height = 21
    DataField = 'ValorHonorarios'
    DataSource = DM.DsAcordo
    DisplayFormat = '###,###,###,###,##0.00'
    FormatOnEditing = True
    NumGlyphs = 2
    TabOrder = 8
    ZeroEmpty = False
  end
  object DBEditValorEntrada: TRxDBCalcEdit
    Left = 406
    Top = 72
    Width = 155
    Height = 21
    DataField = 'ValorAtoEntrada'
    DataSource = DM.DsAcordo
    DisplayFormat = '###,###,###,###,##0.00'
    FormatOnEditing = True
    NumGlyphs = 2
    TabOrder = 7
    ZeroEmpty = False
  end
  object DBEditPeriodicidade: TDBComboBox
    Left = 464
    Top = 120
    Width = 97
    Height = 21
    DataField = 'PeriodicidadeAcordo'
    DataSource = DM.DsAcordo
    ItemHeight = 13
    Items.Strings = (
      '01 - Mensal'
      '02 - Trimestral'
      '03 - Semestral'
      '04 - Anual ')
    TabOrder = 12
  end
  object DBEditMeioPagamento: TDBComboBox
    Left = 222
    Top = 120
    Width = 131
    Height = 21
    DataField = 'CodigoMeioPagamento'
    DataSource = DM.DsAcordo
    ItemHeight = 13
    Items.Strings = (
      '001 - D'#233'bito em conta'
      '007 - Boleto')
    TabOrder = 10
  end
  object DBEditTaxaJuros: TRxDBCalcEdit
    Left = 131
    Top = 120
    Width = 81
    Height = 21
    DataField = 'TaxaJurosAcordo'
    DataSource = DM.DsAcordo
    DisplayFormat = '###,###,###,###,##0.00'
    FormatOnEditing = True
    NumGlyphs = 2
    TabOrder = 9
    ZeroEmpty = False
  end
  object DBEditValorConfessado: TRxDBCalcEdit
    Left = 454
    Top = 32
    Width = 107
    Height = 21
    DataField = 'ValorConfessado'
    DataSource = DM.DsAcordo
    DisplayFormat = '###,###,###,###,##0.00'
    FormatOnEditing = True
    NumGlyphs = 2
    TabOrder = 3
    ZeroEmpty = False
  end
end
