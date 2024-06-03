unit FrmAbastecimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, UAbastecimentoSerivo,
  Vcl.StdCtrls, Vcl.Buttons, UBombaServico, UTanqueServico;

type
  T_FrmAbastecimento = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    TxtIdBomba: TEdit;
    txtNomeBomba: TEdit;
    BitBtn1: TBitBtn;
    Label2: TLabel;
    TxtqtdLitrosAbastecer: TEdit;
    Label3: TLabel;
    txtAliquota: TEdit;
    Label4: TLabel;
    txtPrecoUnitario: TEdit;
    Panel2: TPanel;
    TxtTotal: TEdit;
    Label5: TLabel;
    BitBtn2: TBitBtn;
    procedure TxtqtdLitrosAbastecerKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Enter(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure MascaraDeValor(Sender: TObject; var Key: Char; pTexto : string);
    procedure txtPrecoUnitarioKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    FAbastecimentoServico : TAbastecimentoServico;
    FTanqueServico : TTanqueServico;
    FBombaServico : TBombaServico;

    function CalcularTotal(pQtdLitros,pVnitatio : double) : Double;
  public
    { Public declarations }
    constructor Create(Awoner : TComponent; 
        pAbastecimentoServico : TAbastecimentoServico;
        pTanqueServico : TTanqueServico;
        pBombaServico : TBombaServico); overload;
  end;

var
  _FrmAbastecimento: T_FrmAbastecimento;

implementation

uses
  FrmBomba;

{$R *.dfm}

{ T_FrmAbastecimento }

procedure T_FrmAbastecimento.BitBtn1Click(Sender: TObject);
begin
  _frmBomba := T_frmBomba.Create(self,FBombaServico,FTanqueServico);
  _frmBomba.btnincluir.Visible := False;
  _frmBomba.btnselecionar.Visible := True;
  _frmBomba.ShowModal();
   TxtIdBomba.Text := _frmBomba.bombaDTO.Id.ToString();
   txtNomeBomba.Text := _frmBomba.bombaDTO.NomeBomba;
  _frmBomba.Release;
  TxtqtdLitrosAbastecer.SetFocus;
end;

procedure T_FrmAbastecimento.BitBtn2Click(Sender: TObject);
var
  abastecimentoDTO : TAbastecimentoDTO;
begin
    if TxtIdBomba.Text = string.Empty then
       exit;

    if(application.MessageBox('Confimar abastecimento?','Confirmação',MB_YESNO+MB_ICONQUESTION)=ID_NO)then
       exit;

     try  
        abastecimentoDTO := TAbastecimentoDTO.Create;
        abastecimentoDTO.Valor    := StrToFloat(TxtTotal.Text);
        abastecimentoDTO.Vunitario:= StrToFloat(txtPrecoUnitario.Text);
        abastecimentoDTO.Litros   := StrToFloat(TxtqtdLitrosAbastecer.Text);
        abastecimentoDTO.Aliquota := 13;
        abastecimentoDTO.IdBomba  := StrToInt(TxtIdBomba.Text);
        FAbastecimentoServico.Abastecer(abastecimentoDTO);
     finally
        abastecimentoDTO.Free;
     end;
end;

procedure T_FrmAbastecimento.BitBtn2Enter(Sender: TObject);
begin
   TxtTotal.Text := FormatFloat('###,##,0.00',CalcularTotal(StrToFloat(TxtqtdLitrosAbastecer.Text),
                    StrToFloat(txtPrecoUnitario.Text)));
end;

function T_FrmAbastecimento.CalcularTotal(pQtdLitros,
  pVnitatio: double): Double;
begin
   Result :=  StrToFloat(FormatFloat('###,##,0.00',pQtdLitros *  pVnitatio));
end;

constructor T_FrmAbastecimento.Create(Awoner: TComponent;
  pAbastecimentoServico: TAbastecimentoServico; pTanqueServico : TTanqueServico;
  pBombaServico : TBombaServico);
begin
    inherited Create(Awoner);
    FAbastecimentoServico := pAbastecimentoServico;
    FBombaServico  := pBombaServico ;
    FTanqueServico := pTanqueServico;

    FormatSettings.DecimalSeparator := '.';
end;

procedure T_FrmAbastecimento.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #13 then
    begin
      key := #0;
      Perform(WM_NEXTDLGCTL,0,0);
    end;
end;

procedure T_FrmAbastecimento.MascaraDeValor(Sender: TObject; var Key: Char; pTexto : string);
begin
     if not (key in['0'..'9']) and (key <>#13) and (key <> '.') and (key <> #8)then
     key := #0;

    if (key = '.') and (pos('.',pTexto)<>0) then
      key := #0;
end;

procedure T_FrmAbastecimento.txtPrecoUnitarioKeyPress(Sender: TObject;
  var Key: Char);
begin
    MascaraDeValor(Sender,key,self.txtPrecoUnitario.Text);
end;

procedure T_FrmAbastecimento.TxtqtdLitrosAbastecerKeyPress(Sender: TObject; var Key: Char);
begin
     MascaraDeValor(Sender,key,self.TxtqtdLitrosAbastecer.Text);
end;

end.
