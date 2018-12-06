unit untCadAcordo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, ComCtrls, ToolEdit, RXDBCtrl, CurrEdit,
  ExtCtrls, Grids, DBGrids, DB;

type
  TFrmAcordo = class(TForm)
    Label1: TLabel;
    DBEditNumeroAcordo: TDBEdit;
    Label2: TLabel;
    Label20: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    DBEditNumParcelas: TDBEdit;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label35: TLabel;
    Label37: TLabel;
    DBEditTaxaRef: TDBComboBox;
    DBMemoObs: TDBMemo;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label13: TLabel;
    Label36: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    DBEditNomeCliente: TDBEdit;
    DBEditCpfCnpjCliente: TDBEdit;
    GroupBoxEndereco: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    DBEditLogradouroCliente: TDBEdit;
    DBEditNumeroEnderecoCliente: TDBEdit;
    DBEditComplementoEnderecoCliente: TDBEdit;
    DBEditBairroEnderecoCliente: TDBEdit;
    DBEditMunicipioEnderecoCliente: TDBEdit;
    DBEditCepEnderecoCliente: TDBEdit;
    DBEditDDDCliente: TDBEdit;
    DBEditUfEnderecoCliente: TDBComboBox;
    DBEditTelefoneCliente: TDBEdit;
    DBEditNumContaCliente: TDBEdit;
    DBEditNumAgenciaCliente: TDBEdit;
    TabSheet3: TTabSheet;
    GroupBox3: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    DBEditNomeAvalista1: TDBEdit;
    DBEditNomeAvalista2: TDBEdit;
    DBEditCpfAvalista1: TDBEdit;
    DBEditCpfAvalista2: TDBEdit;
    GroupBox4: TGroupBox;
    ButtonSalvarAcordo: TButton;
    ButtonCancelarAcordo: TButton;
    DBEditAssinatura: TDBDateEdit;
    DBEdit1Vencimento: TDBDateEdit;
    DBEditValorAcordo: TRxDBCalcEdit;
    DBEditValorParcela: TRxDBCalcEdit;
    DBEditHonorario: TRxDBCalcEdit;
    DBEditValorEntrada: TRxDBCalcEdit;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Label21: TLabel;
    DBEditNumContrato: TDBEdit;
    Label22: TLabel;
    DBEditNumCarteira: TDBEdit;
    Label23: TLabel;
    Label24: TLabel;
    DBEditUltimoPagamento: TDBEdit;
    DBEditVencimento: TDBDateEdit;
    ButtonAdicionarPendencia: TButton;
    ButtonSalvarPendencia: TButton;
    ButtonApagarPendencia: TButton;
    DBEditPeriodicidade: TDBComboBox;
    DBEditMeioPagamento: TDBComboBox;
    DBEditTipoAvalista2: TDBComboBox;
    DBEditTipoAvalista1: TDBComboBox;
    DBEditTipoPessoaCliente: TDBComboBox;
    DBEditTaxaJuros: TRxDBCalcEdit;
    TabSheet4: TTabSheet;
    GroupBox5: TGroupBox;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    DBEditNomeOperadorDRC: TDBEdit;
    DBEditAprovadoDRC: TDBComboBox;
    DBEditDtaAprovacaoDRC: TDBDateEdit;
    procedure ButtonCancelarAcordoClick(Sender: TObject);
    procedure ButtonSalvarAcordoClick(Sender: TObject);
    procedure ButtonAdicionarPendenciaClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure ButtonSalvarPendenciaClick(Sender: TObject);
    procedure ButtonApagarPendenciaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAcordo: TFrmAcordo;

implementation

uses untDM, Math;

{$R *.dfm}

procedure TFrmAcordo.ButtonCancelarAcordoClick(Sender: TObject);
begin
    DM.TbAcordo.Cancel;
    Close;
end;

procedure TFrmAcordo.ButtonSalvarAcordoClick(Sender: TObject);
begin
    DM.TbAcordo.Post;
    Close;
end;

procedure TFrmAcordo.ButtonAdicionarPendenciaClick(Sender: TObject);
begin
    if (DM.TbAcordoCdigo.IsNull) then
    begin
        showMessage('Você precisa salvar os dados do arcordo');
        exit;
    end;

    DM.TbPendencia.Append;
    DM.TbPendenciaAcordo.Value := DM.TbAcordoCdigo.Value;
end;

procedure TFrmAcordo.DBGrid1DblClick(Sender: TObject);
begin
    If (DM.TbPendenciaCdigo.IsNull) then exit;

    DM.TbPendencia.Edit; 
end;

procedure TFrmAcordo.ButtonSalvarPendenciaClick(Sender: TObject);
begin
    if not (DM.TbPendencia.State in [dsEdit, dsInsert]) then Exit;

    DM.TbPendencia.Post;
end;

procedure TFrmAcordo.ButtonApagarPendenciaClick(Sender: TObject);
begin
    If (DM.TbPendenciaCdigo.IsNull) then exit;

    if (messageDlg('Voce tem certeza quer quer apagar esse registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
        DM.TbPendencia.Delete;
end;

end.
