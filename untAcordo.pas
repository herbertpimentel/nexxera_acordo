unit untAcordo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Mask, DBCtrls, DateUtils;

type
  TFrmPrincipal = class(TForm)
    ButtonGerarArquivoRemessa: TButton;
    GroupBoxEscritorio: TGroupBox;
    GroupBoxAcodos: TGroupBox;
    DBGrid1: TDBGrid;
    EditLocalizarAcordo: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    DBEditCpfAdministrador: TDBEdit;
    Label3: TLabel;
    DBEditNomeAdministrador: TDBEdit;
    Label4: TLabel;
    DBEditNomeEscritorio: TDBEdit;
    Label5: TLabel;
    DBEditDDDEscritorio: TDBEdit;
    Label6: TLabel;
    DBEditTelefoneEscritorio: TDBEdit;
    Label7: TLabel;
    DBEditSiglaEscritorio: TDBEdit;
    ButtonAdicionarAcordo: TButton;
    ButtonSalvarDadosEscritorio: TButton;
    SaveDialog1: TSaveDialog;
    Label8: TLabel;
    DBEditContadorEscritorio: TDBEdit;
    Label9: TLabel;
    procedure ButtonAdicionarAcordoClick(Sender: TObject);
    procedure ButtonSalvarDadosEscritorioClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure ButtonGerarArquivoRemessaClick(Sender: TObject);
    procedure EditLocalizarAcordoChange(Sender: TObject);
  private
    { Private declarations }
    function calcularDataVencimentoParcela(dataBase: TDate; numeroParcela: Integer): TDate;
    function calcularDataVencimentoUltimaParcela(): TDate; 
    function formatarValorDinheiro(valor: currency): String;
    procedure validarAcordo;
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses untDM, untCadAcordo, untUtil;

{$R *.dfm}

procedure TFrmPrincipal.ButtonAdicionarAcordoClick(Sender: TObject);
begin
    if (DM.TbEscritorioCdigo.IsNull) then
    begin
        ShowMessage('Voc� precisa salvar os dados do escrit�rio');
        Exit;
    end;
    
    DM.TbAcordo.Append;
    DM.TbAcordoEscritorio.Value := DM.TbEscritorioCdigo.Value;
    FrmAcordo.PageControl1.ActivePageIndex := 0;
    FrmAcordo.ShowModal;
end;

procedure TFrmPrincipal.ButtonSalvarDadosEscritorioClick(Sender: TObject);
begin
    DM.TbEscritorio.Post;
end;

procedure TFrmPrincipal.DBGrid1DblClick(Sender: TObject);
begin
    DM.TbAcordo.edit;
    FrmAcordo.PageControl1.ActivePageIndex := 0;
    FrmAcordo.ShowModal;
end;

procedure TFrmPrincipal.ButtonGerarArquivoRemessaClick(Sender: TObject);
var
    SL : TStringList;
    caminho: String;
    contadorArquivo : integer;
    linha: String;
    qtd_parcelas : integer;
    qtd_pendencias: integer;
    qtd_registros: integer;
    i: integer;
begin
//    showmessage(StringRightPad('beto', 2, ' ')); exit;

    validarAcordo;

    contadorArquivo := DM.TbEscritoriocontador_acordos.AsInteger + 1;

    // sugere o nome do arquivo conforme especificado
    SaveDialog1.FileName := 'acordo_' + DM.TbEscritoriosigla_escritorio.AsString + '_' + FormatDateTime('DDMMYYYY', Now) + StringLeftPad(IntToStr(contadorArquivo), 2, '0') + '.txt';

    if not SaveDialog1.Execute then Exit;

    caminho := SaveDialog1.FileName;

    if (caminho = EmptyStr) then Exit;

    // prepara a cria��o do arquivo
    SL := TStringList.Create();

    qtd_parcelas := DM.TbAcordoQuantidadeParcelas.AsInteger;
    qtd_pendencias := DM.TbPendencia.RecordCount;

    // tem que gerar uma linha para cada parcela
    // se houverem mais pendencias que parcelas s�o geradas linhas extras para pendencia
    if (qtd_parcelas > qtd_pendencias) then
        qtd_registros :=  qtd_parcelas
    else
        qtd_registros := qtd_pendencias;

    // prosiciona o cursor no inicio das pendencias para fazer o registro de uma a uma delas
    DM.TbPendencia.First;

    for i := 1 to qtd_registros do
    begin
        // tipo de registro
        linha := 'A';

        // ato
        linha := linha + iif(((DM.TbAcordoValorAtoEntrada.AsCurrency > 0) and (i = 1)), 'S', 'N');

        // cpf administrador escrit�rio
        linha := linha + Copy(StringLeftPad(DM.TbEscritoriocpf_administrdor_escritorio.AsString, 9, '0'), 1, 9);

        // numero do acordo
        linha := linha + Copy(StringLeftPad(DM.TbAcordoNumeroAcordo.AsString, 11, '0'), 1, 11);

        // data do acordo
        linha := linha + FormatDateTime('DD.MM.YYYY', DM.TbAcordoDataAcordo.AsDateTime);

        // quantidade pendencias
        linha := linha + Copy(StringLeftPad(IntToStr(DM.TbPendencia.RecordCount), 4, '0'), 1, 4);

        // quantidade parcelas
        linha := linha + Copy(StringLeftPad(IntToStr(DM.TbAcordoQuantidadeParcelas.AsInteger), 4, '0'), 1, 4);

        // codigo da agencia
        linha := linha + Copy(StringLeftPad(IntToStr(DM.TbAcordoNumeroAgenciaCliente.AsInteger), 4, '0'), 1, 4);

        // numero da conta corrente
        linha := linha + Copy(StringLeftPad(IntToStr(DM.TbAcordoNumeroContaCliente.AsInteger), 7, '0'), 1, 7);

        // numero da carteira
        linha := linha + Copy(StringLeftPad(DM.TbPendenciaNumeroCarteira.AsString, 5, '0'), 1, 5);

        // numero do contrato
        linha := linha + Copy(StringLeftPad(DM.TbPendenciaNumeroContrato.AsString, 9, '0'), 1, 9);

        // quando o numero de pendencias/contratos � maior queo numero de parcelas
        // devem ser validados apenas os campos at� posi��o 65
        if (DM.TbPendencia.RecNo > qtd_parcelas) then
        begin
            // quebra a string apenas porque o DELPHI tem a limita��o de 255 caracteres por linnha
            linha := linha
                // data vencimento da pendencia
                + StringLeftPad('', 10, ' ')
                // data vencimento da parcela do acordo
                + StringLeftPad('', 10, ' ')
                // valor da parcela
                + formatarValorDinheiro(0)
                // valor honorarios
                + formatarValorDinheiro(0)
                // taxa de referencia (S ou N)
                + ' '
                // observacao
                + StringLeftPad('', 44, ' ')
                // codigo de erro
                + StringLeftPad('', 60, ' ')
                // nome do escritorio
                + StringLeftPad('', 40, ' ')
                // DDD do escritorio
                + StringLeftPad('',  4, '0')
                // telefone do escritorio
                + StringLeftPad('',  9, '0')
                // nome do cliente
                + StringLeftPad('', 40, ' ')
                // endereco do cliente
                + StringLeftPad('', 40, ' ')
                // numero endereco do cliente
                + StringLeftPad('',  7, ' ')
                // complemento endereco do cliente
                + StringLeftPad('', 20, ' ')
                // bairro do cliente
                + StringLeftPad('', 20, ' ')
                // municipio do cliente
                + StringLeftPad('', 30, ' ')
                // uf do cliente
                + StringLeftPad('',  2, ' ')
                // CEP + Complmento CEP do cliente
                + StringLeftPad('',  8, '0')
                // DDD do cliente
                + StringLeftPad('',  4, ' ')
                // telefone do cliente
                + StringLeftPad('',  9, '0')
                // valor total do acordo
                + formatarValorDinheiro(0)
                // data de vencimento da ultima parcela
                + StringLeftPad('', 10, ' ')
                // numero da ultima parcela paga
                + StringLeftPad('',  4, '0')
                // cpf/cnpj cliente
                + StringLeftPad('',  9, '0')
                // filial cnpj cliente
                + StringLeftPad('',  4, '0')
                // digito cpf/cnpj cliente
                + StringLeftPad('', 2, ' ')
                // codigo meio de pagamento
                + StringLeftPad('', 3, ' ')
                // valor do iof
                + formatarValorDinheiro(0)
                // taxa de juros do acordo
                + formatarValorDinheiro(0)
                // aprovado pelo DRC
                + ' '
                // data aprovacao DRC
                + StringLeftPad('', 10, ' ')
                // nome do operador do DRC
                + StringLeftPad('', 15, ' ')
                // nome do avalista 1
                + StringLeftPad('', 40, ' ')
                // nome do avalista 2
                + StringLeftPad('', 40, ' ')
                // cpf do avalista 1
                + StringLeftPad('', 9, '0')
                // filial avalista 1
                + StringLeftPad('', 4, '0')
                // digito cpf avalista 1
                + StringLeftPad('', 2, '0')
                // cpf do avalista 2
                + StringLeftPad('', 9, '0')
                // filial avalista 2
                + StringLeftPad('', 4, '0')
                // digito cpf avalista 2
                + StringLeftPad('', 2, '0')
                // valor confessado
                + formatarValorDinheiro(0)
                // indicacao periodicidade acordo
                + StringLeftPad('', 2, '0');
        end
        else
        begin
            // data vencimento da pendencia
            linha := linha + FormatDateTime('DD.MM.YYYY', DM.TbPendenciaDataVencimento.AsDateTime);

            // data vencimento da parcela do acordo
            linha := linha + FormatDateTime('DD.MM.YYYY', calcularDataVencimentoParcela(DM.TbAcordoDataVencimento1ParcelaAcordo.AsDateTime, i));

            // valor da parcela (se for a 1, ent�o � o valor dado no ato, senao � o valor das demais parcelas)
            linha := linha + iif(((DM.TbAcordoValorAtoEntrada.AsFloat > 0.0) and (i = 1)), formatarValorDinheiro(DM.TbAcordoValorAtoEntrada.AsCurrency), formatarValorDinheiro(DM.TbAcordoValorParcelaAcordo.AsCurrency));

            // valor honorarios
            linha := linha + formatarValorDinheiro(DM.TbAcordoValorHonorarios.AsCurrency);

            // taxa de referencia (S ou N)
            linha := linha + Copy(DM.TbAcordoTaxaReferencia.AsString, 1, 1);

            // observacao
            linha := linha + Copy(StringRightPad(DM.TbAcordoObservacao.AsString, 44, ' '), 1, 44);

            // codigo de erro
            linha := linha + Copy(StringRightPad('', 60, ' '), 1, 60);

            // nome do escritorio
            linha := linha + Copy(StringRightPad(DM.TbEscritorionome_escritorio.AsString, 40, ' '), 1, 40);

            // DDD do escritorio
            linha := linha + Copy(StringRightPad(DM.TbEscritorioddd_escritorio.AsString, 4, '0'), 1, 4);

            // telefone do escritorio
            linha := linha + Copy(StringRightPad(DM.TbEscritorioddd_escritorio.AsString, 9, '0'), 1, 9);

            // nome do cliente
            linha := linha + Copy(StringRightPad(DM.TbAcordoNomeCliente.AsString, 40, ' '), 1, 40);

            // endereco do cliente
            linha := linha + Copy(StringRightPad(DM.TbAcordoEnderecoCliente.AsString, 40, ' '), 1, 40);

            // numero endereco do cliente
            linha := linha + Copy(StringRightPad(DM.TbAcordoNumeroEnderecoCliente.AsString, 7, ' '), 1, 7);

            // complemento endereco do cliente
            linha := linha + Copy(StringRightPad(DM.TbAcordoComplementoEnderecoCliente.AsString, 20, ' '), 1, 20);

            // bairro do cliente
            linha := linha + Copy(StringRightPad(DM.TbAcordoBairroCliente.AsString, 20, ' '), 1, 20);

            // municipio do cliente
            linha := linha + Copy(StringRightPad(DM.TbAcordoBairroCliente.AsString, 30, ' '), 1, 30);

            // uf do cliente
            linha := linha + Copy(StringRightPad(DM.TbAcordoUFCliente.AsString, 2, ' '), 1, 2);

            // CEP + Complmento CEP do cliente
            linha := linha + Copy(StringRightPad(DM.TbAcordoCepCliente.AsString, 8, '0'), 1, 8);

            // DDD do cliente
            linha := linha + Copy(StringRightPad(DM.TbAcordoDDDCliente.AsString, 4, ' '), 1, 4);

            // telefone do cliente
            linha := linha + Copy(StringRightPad(DM.TbAcordoDDDCliente.AsString, 9, '0'), 1, 9);

            // valor total do acordo
            linha := linha + formatarValorDinheiro(DM.TbAcordoValorTotalAcordo.AsCurrency);

            // data de vencimento da ultima parcela
            linha := linha + FormatDateTime('DD.MM.YYYY', calcularDataVencimentoUltimaParcela());

            // numero da ultima parcela paga
            linha := linha + Copy(StringLeftPad(DM.TbPendenciaUltimaParcelaPaga.AsString, 4, '0'), 1, 4);

            if (length(DM.TbAcordoCpfCnpjCliente.AsString) = 11) then
            begin
               // CLIENTE CPF
               // preencher com 9 primeiros digitos + 0000 + 2 dv cpf
               // cpf/cnpj cliente
               linha := linha + Copy(DM.TbAcordoCpfCnpjCliente.AsString, 1, 9) + '0000' + Copy(DM.TbAcordoCpfCnpjCliente.AsString, 10, 2);
            end
            else
            begin
               // CLIENTE CNPJ
               // preencher com 0 + 8 primeiros digitos + filial + 2 dv cnpj
               // OU SEJA o proprio cnpj com um zero na frente pra completar as 15 posicoes
               linha := linha + StringLeftPad(DM.TbAcordoCpfCnpjCliente.AsString, 15, '0');
            end;

            // codigo meio de pagamento
            linha := linha + Copy(StringLeftPad(Copy(DM.TbAcordoCodigoMeioPagamento.AsString, 1, 3), 3, ' '), 1, 3);

            // valor do iof (deve ser encaminhado com zeros)
            linha := linha + formatarValorDinheiro(0.0);

            // taxa de juros do acordo
            linha := linha + StringReplace((formatfloat('0000000000.0000000', DM.TbAcordoTaxaJurosAcordo.AsCurrency)),',','',[rfReplaceAll]);

            // aprovado pelo DRC
            linha := linha + Copy(StringRightPad(Copy(DM.TbAcordoDrcAcordoAprovado.AsString, 1, 1), 1, ' '), 1, 1);

            // data aprovacao DRC
            linha := linha + FormatDateTime('DD.MM.YYYY', DM.TbAcordoDrcDataAprovacaoAcordo.AsDateTime);

            // nome do operador do DRC
            linha := linha + Copy(StringRightPad(Copy(DM.TbAcordoDrcNomeOperadorAprovacao.AsString, 1, 15), 15, ' '), 1, 15);

            // nome do avalista 1
            linha := linha + Copy(StringRightPad(Copy(DM.TbAcordoNomeAvalista1.AsString, 1, 40), 40, ' '), 1, 40);

            // nome do avalista 2
            linha := linha + Copy(StringRightPad(Copy(DM.TbAcordoNomeAvalista2.AsString, 1, 40), 40, ' '), 1, 40);

            // cpf do avalista 1
            if (length(DM.TbAcordoCpfCnpjAvalista1.AsString) = 11) then
               linha := linha + Copy(DM.TbAcordoCpfCnpjAvalista1.AsString, 1, 9) + '0000' + Copy(DM.TbAcordoCpfCnpjAvalista1.AsString, 10, 2)
            else
               linha := linha + StringLeftPad(DM.TbAcordoCpfCnpjAvalista1.AsString, 15, '0');

            // cpf do avalista 2
            if (length(DM.TbAcordoCpfCnpjAvalista2.AsString) = 11) then
               linha := linha + Copy(DM.TbAcordoCpfCnpjAvalista2.AsString, 1, 9) + '0000' + Copy(DM.TbAcordoCpfCnpjAvalista2.AsString, 10, 2)
            else
               linha := linha + StringLeftPad(DM.TbAcordoCpfCnpjAvalista2.AsString, 15, '0');

            // valor confessado
            linha := linha + formatarValorDinheiro(DM.TbAcordoValorConfessado.AsCurrency);

            // indicacao periodicidade acordo
            linha := linha + Copy(StringLeftPad(DM.TbAcordoPeriodicidadeAcordo.AsString, 2, '0'), 1, 2);
        end;

        SL.Add(linha);

        // passa para proxima pend�ncia
        DM.TbPendencia.Next;
    end;

    SL.SaveToFile(caminho);

    // atualiza o contador de arquivos gerados pelo escrit�rio
    if not (DM.TbEscritorio.State in [dsInsert, dsEdit]) then
        DM.TbEscritorio.Edit;

    DM.TbEscritoriocontador_acordos.AsInteger := contadorArquivo;
    DM.TbEscritorio.Post;

    // registra a greacao do arquivo
    if not (DM.TbAcordo.State in [dsInsert, dsEdit]) then
        DM.TbAcordo.Edit;

    DM.TbAcordoDtGeracaoArquivo.Value := now();
    DM.TbAcordo.Post;

    showmessage('Arquivo de remessa gerado em ' + caminho);
end;

function TFrmPrincipal.calcularDataVencimentoParcela(dataBase: TDate;
  numeroParcela: Integer): TDate;
begin
    // fallback para o modo mensal
    Result := IncMonth(dataBase, numeroParcela - 1);

    // mensal
    if Copy(DM.TbAcordoPeriodicidadeAcordo.AsString, 1, 2) = '01' then
        Result := IncMonth(dataBase, numeroParcela - 1);

    // trimetral
    if Copy(DM.TbAcordoPeriodicidadeAcordo.AsString, 1, 2) = '02' then
        Result := IncMonth(dataBase, numeroParcela * 3);

    // semestral
    if Copy(DM.TbAcordoPeriodicidadeAcordo.AsString, 1, 2) = '03' then
        Result := IncMonth(dataBase, numeroParcela * 6);

    // anual
    if Copy(DM.TbAcordoPeriodicidadeAcordo.AsString, 1, 2) = '04' then
        Result := IncYear(dataBase, numeroParcela);
end;

function TFrmPrincipal.formatarValorDinheiro(valor: currency): String;
begin
    Result := StringLeftPad(StringReplace(FormatCurr('0.00', valor), ',', '', [rfReplaceAll]), 17, '0');
end;

function TFrmPrincipal.calcularDataVencimentoUltimaParcela: TDate;
var
    dataBase: TDate;
    numeroParcelas: integer;
begin
    dataBase := DM.TbAcordoDataVencimento1ParcelaAcordo.AsDateTime;
    numeroParcelas := DM.TbAcordoQuantidadeParcelas.AsInteger;

    // fallback para o modo mensal
    Result := IncMonth(dataBase, numeroParcelas - 1);

    // mensal
    if Copy(DM.TbAcordoPeriodicidadeAcordo.AsString, 1, 2) = '01' then
        Result := IncMonth(dataBase, numeroParcelas - 1);

    // trimetral
    if Copy(DM.TbAcordoPeriodicidadeAcordo.AsString, 1, 2) = '02' then
        Result := IncMonth(dataBase, numeroParcelas * 3);

    // semestral
    if Copy(DM.TbAcordoPeriodicidadeAcordo.AsString, 1, 2) = '03' then
        Result := IncMonth(dataBase, numeroParcelas * 6);

    // anual
    if Copy(DM.TbAcordoPeriodicidadeAcordo.AsString, 1, 2) = '04' then
        Result := IncYear(dataBase, numeroParcelas);
end;

procedure TFrmPrincipal.validarAcordo;
var
    qtd_parcelas: integer;
begin
    // aplica as criicas antes de gerar o arquivo do acordo

    if (DM.TbEscritorionome_escritorio.IsNull) then
        raise Exception.Create('Você precisa preencher o nome do escritório');

    if (DM.TbAcordoNomeCliente.IsNull) then
        raise Exception.Create('Você precisa preencher o nome do cliente');

    if (DM.TbPendencia.RecordCount = 0) then
        raise Exception.Create('Você precisa registrar as pendencias que estão no acordo');

    if (DM.TbAcordoValorAtoEntrada.AsCurrency > 0) then
        qtd_parcelas := DM.TbAcordoQuantidadeParcelas.AsInteger - 1
    else
        qtd_parcelas := DM.TbAcordoQuantidadeParcelas.AsInteger;

    //if (((qtd_parcelas * DM.TbAcordoValorParcelaAcordo.AsCurrency) + DM.TbAcordoValorAtoEntrada.AsCurrency) <> DM.TbAcordoValorTotalAcordo.AsCurrency) then
        //raise Exception.Create('O valor total do acordo não pode ser diferente do valor das parcelas + o valor dado no ato');


end;

procedure TFrmPrincipal.EditLocalizarAcordoChange(Sender: TObject);
begin
    DM.TbAcordo.Locate('NomeCliente', iif(Trim(EditLocalizarAcordo.Text) <> '', '%' + Trim(EditLocalizarAcordo.Text), ''), [loPartialKey, loCaseInsensitive])
end;

end.
