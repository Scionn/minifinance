unit affidamenti_frm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, ZDataset, ZSqlUpdate, Forms, Controls,
  Graphics, Dialogs, ExtCtrls, DbCtrls, StdCtrls, DBGrids, tipiaffidamento_frm, fidi_frm;

type

  { TAffidamenti }

  TAffidamenti = class(TForm)
    bttipofido: TButton;
    dbcbcontocorrentefiltro: TDBLookupComboBox;
    dbeddescrizione: TDBEdit;
    dbednumero: TDBEdit;
    dbedreferente: TDBEdit;
    DBGridaffidamenti: TDBGrid;
    dblbidaffidamento: TDBText;
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    Label10: TLabel;
    Label2: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Panel1: TPanel;
    procedure btfidiClick(Sender: TObject);
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
end;

procedure TAffidamenti.btfidiClick(Sender: TObject);
begin
 fidi:=Tfidi.Create(self);
  fidi.showmodal;
end;

end.

