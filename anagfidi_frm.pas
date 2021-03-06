unit anagfidi_frm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  DbCtrls, StdCtrls, DBGrids, datamodule_frm, zdataset, db;

type

  { TanagFidi }

  TanagFidi = class(TForm)
    btcerca: TButton;
    dbcbaffidamento: TDBLookupComboBox;
    dbcbtipoaffidamento: TDBLookupComboBox;
    dbcbaffidamentofiltro: TDBLookupComboBox;
    dbchtotale: TDBCheckBox;
    dbeddescrizione: TDBEdit;
    dbedfido: TDBEdit;
    DBGrid1: TDBGrid;
    dbgridfidi: TDBGrid;
    DBNavigator1: TDBNavigator;
    DBNavigator2: TDBNavigator;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    procedure btcercaClick(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TDBNavButtonType);
    procedure DBNavigator2Click(Sender: TObject; Button: TDBNavButtonType);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  anagFidi: TanagFidi;

implementation

{$R *.lfm}

{ TanagFidi }

procedure TanagFidi.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  CloseAction:=caFree;
end;

procedure TanagFidi.btcercaClick(Sender: TObject);
begin
  //se è selezionato un affidamento lo filtro nel dataset
  if dbcbaffidamentofiltro.ItemIndex <> -1 then
      DataModule1.zqanagfidi.Filter:='idaffidamento='+dbcbaffidamentofiltro.KeyValue

end;

procedure TanagFidi.DBNavigator1Click(Sender: TObject; Button: TDBNavButtonType
  );
begin
   if Button=nbInsert then
        dbcbaffidamento.Enabled:=true;
   if Button=nbEdit then
        dbcbaffidamento.Enabled:=true;
   if Button=nbPost then
      dbcbtipoaffidamento.Enabled:=false;
   if Button=nbCancel then
       dbcbtipoaffidamento.Enabled:=false;
end;

procedure TanagFidi.DBNavigator2Click(Sender: TObject; Button: TDBNavButtonType
  );
begin
  if Button=nbInsert then
      begin
        dbcbtipoaffidamento.Enabled:=true;
         datamodule1.zqfiditipofido.FieldByName('IDFIDO').AsInteger:=DataModule1.zqanagfidi.FieldByName('IDFIDO').AsInteger;
      end;
  if Button=nbPost then
      dbcbtipoaffidamento.Enabled:=false;
  if Button=nbCancel then
      dbcbtipoaffidamento.Enabled:=false;
end;





end.

