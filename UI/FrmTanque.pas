unit FrmTanque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.ExtCtrls, Vcl.StdCtrls, System.Generics.Collections,
  Vcl.Buttons, tanque, Data.SqlExpr, UTanqueServico;

type
  T_FrmTanque = class(TForm)
    Panel1: TPanel;
    gridTanque: TStringGrid;
    btnIncluir: TButton;
    pnlCadTanque: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    TxtNometANQUE: TEdit;
    pnlRodapeCadastro: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    CboCombustivel: TComboBox;
    btnSelecionar: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure gridTanqueSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure btnSelecionarClick(Sender: TObject);
  private
    { Private declarations }
    FTanqueServico : TTanqueServico;
    procedure AtualizarGrid(pTanques : TObjectList<TTAnque>);
  public
    { Public declarations }
    Linha : integer;
    TanqueDTO : TTanque;
    Constructor Create(AOwner: TComponent; pTanqueServico : TTanqueServico); overload;
  end;

var
  _FrmTanque: T_FrmTanque;

implementation

{$R *.dfm}

uses
  EnumTipoCombustivel;

{ TForm3 }

procedure T_FrmTanque.AtualizarGrid(pTanques: TObjectList<TTAnque>);
var
   tanque : TTAnque;
begin
   gridTanque.Cells[0,0] := 'ID';
   gridTanque.Cells[1,0] := 'NOME';
   gridTanque.ColWidths[1] := 120;
   gridTanque.Cells[2,0] := 'COMBUSTIVEL';
   gridTanque.ColWidths[2] := 100;
   gridTanque.RowCount := 1;

   for tanque in pTanques do
   begin
       gridTanque.Cells[0,gridTanque.RowCount] := tanque.Id.ToString();
       gridTanque.Cells[1,gridTanque.RowCount] := tanque.NomeTanque;
       gridTanque.Cells[2,gridTanque.RowCount] := tanque.Combustivel.Nome;
       gridTanque.RowCount := gridTanque.RowCount + 1;
   end;
end;

procedure T_FrmTanque.BitBtn1Click(Sender: TObject);
var
  Tanque : TTanque;
begin
   try
     Tanque := TTanque.Create;
     Tanque.NomeTanque :=  TxtNometANQUE.Text;
     case CboCombustivel.ItemIndex of
        0: Tanque.Combustivel := EnumTipoCombustivel.GASOLINA;
        1: Tanque.Combustivel := EnumTipoCombustivel.DISEL;
     end;

     FTanqueServico.CadastrarNovoTanque(Tanque);
   finally
     AtualizarGrid(FTanqueServico.ObterTodosOsTanques);
     Tanque.Free;
     pnlCadTanque.Visible := False;
   end;
end;

procedure T_FrmTanque.BitBtn2Click(Sender: TObject);
begin
   pnlCadTanque.Visible := False;
end;

procedure T_FrmTanque.btnSelecionarClick(Sender: TObject);
begin
   if linha > 0 then
   begin
       TanqueDTO.Id := StrToInt(gridTanque.Cells[0,linha]);
       TanqueDTO.NomeTanque := gridTanque.Cells[1,linha];
       ModalResult:= -1;
   end;
end;

procedure T_FrmTanque.btnIncluirClick(Sender: TObject);
begin
   pnlCadTanque.Align := alClient;
   pnlCadTanque.Visible := True;
end;

constructor T_FrmTanque.Create(AOwner: TComponent; pTanqueServico : TTanqueServico);
begin
   inherited Create(AOwner);
   FTanqueServico := pTanqueServico;
   TanqueDTO := TTanque.Create;
end;

procedure T_FrmTanque.FormShow(Sender: TObject);
begin
   AtualizarGrid(FTanqueServico.ObterTodosOsTanques);
end;

procedure T_FrmTanque.gridTanqueSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
     linha  := ARow;
end;

end.
