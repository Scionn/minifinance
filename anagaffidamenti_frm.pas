unit anagaffidamenti_frm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, ZDataset, ZSqlUpdate, Forms, Controls,
  Graphics, Dialogs, ExtCtrls, DbCtrls, StdCtrls, DBGrids, anagtipiaffidamento_frm, anagfidi_frm, datamodule_frm;

type

  { TAnagaffidamenti }

  TAnagaffidamenti = class(TForm)
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
  Anagaffidamenti: TAnagaffidamenti;

implementation

{$R *.lfm}

{ TAnagaffidamenti }

procedure TAnagaffidamenti.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
begin
    CloseAction:=cafree;
end;

procedure TAnagaffidamenti.bttipofidoClick(Sender: TObject);
begin
  anagtipiaffidamento:=Tanagtipiaffidamento.Create(self);
  anagtipiaffidamento.showmodal;
  DataModule1.zqtipoaffidamento.Close;
 DataModule1.zqtipoaffidamento.open;
end;

procedure TAnagaffidamenti.btfidiClick(Sender: TObject);
begin
 anagfidi:=Tanagfidi.Create(self);
 anagfidi.showmodal;
 DataModule1.zqfidi.Close;
 DataModule1.zqfidi.open;
end;

end.

