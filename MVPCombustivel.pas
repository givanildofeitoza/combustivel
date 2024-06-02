unit MVPCombustivel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.FMTBcd, Data.DB, Data.SqlExpr,
  Data.DbxSqlite, Vcl.StdCtrls, Vcl.Buttons, UBombaRepositorio,
  UTanqueRepositorio, UAbastecimentoRepositorio, UBombaServico, UTanqueServico,
  UAbastecimentoSerivo;

type
  TForm2 = class(TForm)
    qrPadrao: TSQLQuery;
    ConexaoSQLITE: TSQLConnection;
    Button1: TButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure Button1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
    FBombaRepositorio : TbombaRepositorio;
    FTanquRepositorio : TTanqueRepositorio;
    FAbastecimentoRepositorio : TAbastecimentoRepositorio;
    FBombaServico : TbombaServico;
    FTanquServico : TTanqueServico;
    FAbastecimentoServico : TAbastecimentoServico;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses
  bomba, FrmTanque, FrmBomba, FrmAbastecimento;

{$R *.dfm}

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
   _FrmBomba:=T_FrmBomba.Create(Self,FBombaServico,FTanquServico);
   _FrmBomba.ShowModal();
   _FrmBomba.Release;
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
begin
   _FrmTanque := T_FrmTanque.Create(Self,FTanquServico);
   _FrmTanque.ShowModal();
   _FrmTanque.Release;
end;

procedure TForm2.BitBtn3Click(Sender: TObject);
begin
    _FrmAbastecimento := T_FrmAbastecimento.Create(Self,FAbastecimentoServico,FTanquServico, FBombaServico);
    _FrmAbastecimento.ShowModal();
    _FrmAbastecimento.Release;
end;

procedure TForm2.Button1Click(Sender: TObject);
var
  bomba : TBomba;
  bombaRepositorio : TbombaRepositorio;
begin
   bombaRepositorio := TbombaRepositorio.Create(qrPadrao);
   bomba := TBomba.Create;
   bomba.NomeBomba := 'BOMBA 01';
   bomba.IdTanque := 2;

  // bombaRepositorio.Adicionar(bomba);
   bombaRepositorio.Remover(1);
   bombaRepositorio.Remover(2);
end;

procedure TForm2.FormShow(Sender: TObject);
begin
    FBombaRepositorio := TbombaRepositorio.Create(qrPadrao);
    FTanquRepositorio := TTanqueRepositorio.Create(qrPadrao);
    FAbastecimentoRepositorio := TAbastecimentoRepositorio.Create(qrPadrao);

    FBombaServico := TbombaServico.Create(FBombaRepositorio);
    FTanquServico := TTanqueServico.Create(FTanquRepositorio);
    FAbastecimentoServico := TAbastecimentoServico.Create(FBombaRepositorio,
                                                        FTanquRepositorio,
                                                        FAbastecimentoRepositorio);
end;

end.
