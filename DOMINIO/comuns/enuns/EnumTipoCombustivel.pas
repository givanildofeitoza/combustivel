unit EnumTipoCombustivel;

interface

uses
  TypInfo;

type ETipoCombustivel = (GASOLINA,DISEL);

TCombustivelHelper = record helper for ETipoCombustivel
public
    function Nome: string;
end;

implementation

{ TCombustivelHelper }

function TCombustivelHelper.Nome: string;
begin
   Result := GetEnumName(TypeInfo(ETipoCombustivel), ord(Self));
end;

end.
