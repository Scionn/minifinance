unit estrattoconto_frm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, sqldb, FileUtil, ZDataset, Forms, Controls, Graphics,
  Dialogs, ExtCtrls, DBGrids, StdCtrls;

type

  { Testrattoconto }

  Testrattoconto = class(TForm)
    dsec: TDataSource;
    DBGrid1: TDBGrid;
    lbconto: TLabel;
    lbsaldo: TLabel;
    Panel1: TPanel;
    zqec: TZReadOnlyQuery;
    zqecDATAOP: TDateField;
    zqecDATAVAL: TDateField;
    zqecDESCRIZIONE: TStringField;
    zqecENTRATE: TFloatField;
    zqecRICONCILIATO: TSmallintField;
    zqecsaldo1: TCurrencyField;
    zqecUSCITE: TFloatField;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure zqecAfterOpen(DataSet: TDataSet);
    procedure zqecCalcFields(DataSet: TDataSet);
  private
    { private declarations }
    saldo:Currency;
  public
    { public declarations }
  end;

var
  estrattoconto: Testrattoconto;

implementation

{$R *.lfm}

{ Testrattoconto }

procedure Testrattoconto.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  CloseAction:=cafree;
end;



procedure Testrattoconto.FormShow(Sender: TObject);
begin
  saldo:=0;
end;

procedure Testrattoconto.zqecAfterOpen(DataSet: TDataSet);
begin
lbsaldo.caption:='Saldo conto corrente: ' + FormatCurr('€ #,##0.00',saldo);
end;



procedure Testrattoconto.zqecCalcFields(DataSet: TDataSet);
begin
  zqec.FieldByName('saldo').AsCurrency:=zqec.FieldByName('entrate').AsCurrency-zqec.FieldByName('uscite').AsCurrency+saldo;
  saldo:=zqec.FieldByName('saldo').AsCurrency;
end;

end.

