unit mainform_frm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  DBGrids, StdCtrls, DbCtrls, DBExtCtrls, conti_frm, ZDataset, ZSqlUpdate,
  datamodule_frm, estrattoconto_frm;

type

  { Tmainform }

  Tmainform = class(TForm)
    btconti: TButton;
    Button1: TButton;
    dbchriconciliato: TDBCheckBox;
    dbeddataop: TDBDateEdit;
    dbeddataval: TDBDateEdit;
    dbeddescrizione: TDBEdit;
    dbeddare: TDBEdit;
    dbedavere: TDBEdit;
    dbcbcontocorrente: TDBLookupComboBox;
    dbcbcontocorrentefiltro: TDBLookupComboBox;
    DBNavigator1: TDBNavigator;
    dblbidmovimento: TDBText;
    ds1: TDataSource;
    dbgridmovimenti: TDBGrid;
    dsconti: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    zqconti: TZQuery;
    zupconti: TZUpdateSQL;
    procedure btcontiClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  mainform: Tmainform;

implementation

{$R *.lfm}

{ Tmainform }

procedure Tmainform.btcontiClick(Sender: TObject);
begin
  conti:=Tconti.Create(self);
  conti.showmodal;
end;

procedure Tmainform.Button1Click(Sender: TObject);
begin
    estrattoconto:=Testrattoconto.Create(self);
    estrattoconto.zqec.parambyname('CONTO').asinteger:=dbcbcontocorrentefiltro.KeyValue;
    estrattoconto.zqec.open;
    estrattoconto.showmodal;
end;

procedure Tmainform.FormShow(Sender: TObject);
begin
  //apro i dataset che mi servono
  zqconti.Open;
  datamodule1.zq1.open;
end;

end.

