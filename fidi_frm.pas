unit fidi_frm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  DbCtrls, StdCtrls, DBGrids, datamodule_frm;

type

  { TFidi }

  TFidi = class(TForm)
    btcerca: TButton;
    btaggiungi: TButton;
    btrimuovi: TButton;
    dbcbaffidamento: TDBLookupComboBox;
    dbcbtipoaffidamento: TDBLookupComboBox;
    dbcbaffidamentofiltro: TDBLookupComboBox;
    dbchtotale: TDBCheckBox;
    dbeddescrizione: TDBEdit;
    dbedfido: TDBEdit;
    DBGrid1: TDBGrid;
    dbgridfidi: TDBGrid;
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    procedure btcercaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Fidi: TFidi;

implementation

{$R *.lfm}

{ TFidi }

procedure TFidi.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  CloseAction:=caFree;
end;

procedure TFidi.btcercaClick(Sender: TObject);
begin
  //se è selezionato un affidamento lo filtro nel dataset
  if dbcbaffidamentofiltro.ItemIndex <> -1 then
      DataModule1.zqfidi.Filter:='idaffidamento='+dbcbaffidamentofiltro.KeyValue

end;

end.

