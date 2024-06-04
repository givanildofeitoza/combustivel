unit UDACquery;

interface

uses
  UISQLquery,FireDAC.VCLUI.Wait, FireDAC.Comp.Client;

type
TDACquery = class(TInterfacedObject,ISQLquery)
  private
     FSQL : string;
     FSQLQuery : TFDquery;
     FCampo : string;
  public
     procedure Clear;
     procedure Add(pcnValor : string);
     procedure ExecSQL();
     procedure First;
     procedure Next;

     function FieldByName(pValor : string): ISQLquery;
     function AsString: string;
     function AsInteger: Integer;
     function Eof : Boolean;
     function AsFloat: Double;
     function SQL(): ISQLquery;
     function Open() : TObject;
     constructor Create(pSQLQuery : TFDquery);
end;

implementation

constructor TDACquery.Create(pSQLQuery : TFDquery);
begin
    FSQLQuery := pSQLQuery;
    Clear;
end;

procedure TDACquery.Add(pcnValor : string);
begin
   FSQLQuery.SQL.Add(pcnValor);
end;

function TDACquery.AsFloat: Double;
begin
    Result := FSQLQuery.FieldByName(FCampo).AsFloat;
end;

function TDACquery.AsInteger: Integer;
begin
     Result := FSQLQuery.FieldByName(FCampo).AsInteger;
end;

function TDACquery.AsString: string;
begin
     Result := FSQLQuery.FieldByName(FCampo).AsString;
end;

procedure TDACquery.Clear;
begin
    FSQLQuery.SQL.Clear;
end;

function TDACquery.Eof: Boolean;
begin
   Result := FSQLQuery.Eof;
end;

procedure TDACquery.ExecSQL;
begin
    FSQLQuery.ExecSQL();
end;

function TDACquery.FieldByName(pValor: string): ISQLquery;
begin
    FCampo :=  pValor;
    Result := Self;
end;

procedure TDACquery.First;
begin
    FSQLQuery.First;
end;

procedure TDACquery.Next;
begin
    FSQLQuery.Next;
end;

function TDACquery.Open(): TObject;
begin
    FSQLQuery.Open;
    Result := FSQLQuery;
end;

function TDACquery.SQL: ISQLquery;
begin
    Result := Self;
end;


end.
