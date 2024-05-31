unit MVPCombustivel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.FMTBcd, Data.DB, Data.SqlExpr,
  Data.DbxSqlite, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    qrPadrao: TSQLQuery;
    ConexaoSQLITE: TSQLConnection;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses
  bomba, UBombaRepositorio;

{$R *.dfm}

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

end.
