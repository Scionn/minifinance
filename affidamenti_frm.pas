unit affidamenti_frm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, ZDataset, ZSqlUpdate, Forms, Controls,
  Graphics, Dialogs, ExtCtrls, DbCtrls, StdCtrls, DBGrids, tipiaffidamento_frm;

type

  { TAffidamenti }

  TAffidamenti = class(TForm)
    bttipofido: TButton;
    dbcbcontocorrentefiltro: TDBLookupComboBox;
    dbcbtipoaffido: TDBLookupComboBox;
    dbedfido2: TDBEdit;
    dbeddescrizione: TDBEdit;
    dbedfido: TDBEdit;
    dbednumero: TDBEdit;
    dbedreferente: TDBEdit;
    DBGridaffidamenti: TDBGrid;
    dblbidaffidamento: TDBText;
    DBNavigator1: TDBNavigator;
    dstipoaffidamento: TDataSource;
    Label1: TLabel;
    Label10: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Panel1: TPanel;
    zqtipoaffidamento: TZQuery;
    zuptipoaffidamento: TZUpdateSQL;
    procedure bttipofidoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Affidamenti: TAffidamenti;

implementation

{$R *.lfm}

{ TAffidamenti }

procedure TAffidamenti.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
begin
    CloseAction:=cafree;
end;

procedure TAffidamenti.bttipofidoClick(Sender: TObject);
begin
  tipiaffidamento:=Ttipiaffidamento.Create(self);
  tipiaffidamento.showmodal;
  zqtipoaffidamento.close;
  zqtipoaffidamento.open;
end;

end.

