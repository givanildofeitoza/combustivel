unit FrmBomba;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Grids,System.Generics.Collections,
  bomba, UBombaServico, Vcl.StdCtrls, Vcl.Buttons, UTanqueServico;

type
  T_FrmBomba = class(TForm)
    gridBomba: TStringGrid;
    Panel1: TPanel;
    btnincluir: TButton;
    pnlCadBomba: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    TxtNomeBomba: TEdit;
    pnlRodapeCadastro: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    TxtIdTanque: TEdit;
    txtNomeTanque: TEdit;
    BitBtn3: TBitBtn;
    btnSelecionar: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btnincluirClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure gridBombaSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure btnSelecionarClick(Sender: TObject);
  private
    { Private declarations }
     FBombaServico : TBombaServico;
     FTanquServico : TTanqueServico;
     procedure AtualizarGrid(pBombas : TObjectList<TBomba>);
  public
    { Public declarations }
    linha : integer;
    bombaDTO : TBomba;
    constructor Create(AOwner: TComponent; pBombaServico : TBombaServico; pTanquServico: TTanqueServico); overload;
  end;

var
  _FrmBomba: T_FrmBomba;

implementation

uses
  FrmTanque;

{$R *.dfm}

{ TForm1 }

procedure T_FrmBomba.AtualizarGrid(pBombas: TObjectList<TBomba>);
var
   bomba : TBomba;
begin
   gridBomba.Cells[0,0] := 'ID';
   gridBomba.Cells[1,0] := 'NOME';
   gridBomba.ColWidths[1] := 120;
   gridBomba.RowCount := 1;

   for bomba in pBombas do
   begin
       gridBomba.Cells[0,gridBomba.RowCount] := bomba.Id.ToString();
       gridBomba.Cells[1,gridBomba.RowCount] := bomba.NomeBomba;
       gridBomba.RowCount := gridBomba.RowCount + 1;
   end;
end;
procedure T_FrmBomba.BitBtn1Click(Sender: TObject);
var
  bomba : TBomba;
begin
   try
      bomba := Tbomba.Create;
      bomba.NomeBomba := TxtNomeBomba.Text;
      bomba.IdTanque  := StrToInt(TxtIdTanque.Text);
      FBombaServico.CadastrarNovaBomba(bomba);
   finally
      bomba.Free;
      pnlCadBomba.Visible := False;
      AtualizarGrid(FBombaServico.ObterTodasAsBombas);
   end;
end;

procedure T_FrmBomba.BitBtn2Click(Sender: TObject);
begin
   pnlCadBomba.Visible := False;
end;

procedure T_FrmBomba.BitBtn3Click(Sender: TObject);
begin
   _FrmTanque := T_FrmTanque.Create(Self,FTanquServico);
   _FrmTanque.btnIncluir.Visible := False;
   _FrmTanque.btnSelecionar.Visible := True;
   _FrmTanque.ShowModal();

    TxtIdTanque.Text   := _FrmTanque.TanqueDTO.Id.ToString;
    txtNomeTanque.Text := _FrmTanque.TanqueDTO.NomeTanque;
   _FrmTanque.Release;
end;

procedure T_FrmBomba.btnSelecionarClick(Sender: TObject);
begin
   if linha > 0 then
   begin
      bombaDTO.Id := StrToInt(gridBomba.Cells[0,linha]);
      bombaDTO.NomeBomba := gridBomba.Cells[1,linha];
      ModalResult := -1;
   end;
end;

procedure T_FrmBomba.btnincluirClick(Sender: TObject);
begin
    TxtNomeBomba.Text:= string.Empty;
    pnlCadBomba.Align := alClient;
    pnlCadBomba.Visible := True;
end;

constructor T_FrmBomba.Create(AOwner: TComponent; pBombaServico: TBombaServico;
 pTanquServico: TTanqueServico);
begin
   inherited Create(AOwner);
   FBombaServico  := pBombaServico;
   FTanquServico  := pTanquServico;
   bombaDTO := TBomba.Create;
end;

procedure T_FrmBomba.FormShow(Sender: TObject);
begin
    AtualizarGrid(FBombaServico.ObterTodasAsBombas);
end;

procedure T_FrmBomba.gridBombaSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
    linha := aRow;
end;

end.
