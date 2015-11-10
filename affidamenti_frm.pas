unit affidamenti_frm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, ZDataset, ZSqlUpdate, Forms, Controls,
  Graphics, Dialogs, DBGrids, ExtCtrls, StdCtrls, DbCtrls, DBExtCtrls, Buttons,
  datamodule_frm;

type

  { TAffidamenti }

  TAffidamenti = class(TForm)
    btcopiavalore: TButton;
    dbchgenerato1: TDBCheckBox;
    dbchgenerato2: TDBCheckBox;
    dbedentrate: TDBEdit;
    DBNavigator1: TDBNavigator;
    dbcbtipofin: TDBLookupComboBox;
    dbchchiuso: TDBCheckBox;
    dbeddatadoc: TDBDateEdit;
    dbeddataest: TDBDateEdit;
    dbeddataop: TDBDateEdit;
    dbeddataval: TDBDateEdit;
    dbeddescr: TDBEdit;
    dbednumdoc: TDBEdit;
    dbednumfin: TDBEdit;
    dbedscadfin: TDBDateEdit;
    dbedscadoc: TDBDateEdit;
    dbeduscite: TDBEdit;
    DBText3: TDBText;
    dsaff: TDataSource;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lbaffidamenti: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    zqaff: TZQuery;
    zupaff: TZUpdateSQL;
    procedure btcopiavaloreClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure zqaffAfterScroll(DataSet: TDataSet);
    procedure zqaffBeforePost(DataSet: TDataSet);
    procedure zupaffBeforeInsertSQLStatement(const Sender: TObject;
      StatementIndex: Integer; out Execute: Boolean);
    procedure zupaffBeforeModifySQLStatement(const Sender: TObject;
      StatementIndex: Integer; out Execute: Boolean);

  private
    { private declarations }
  public
    { public declarations }
    idaffidamento, idconto:integer;
    datada,dataa:tdate;
    nomeaffidamento:string;
  end;

var
  Affidamenti: TAffidamenti;

implementation

{$R *.lfm}

{ TAffidamenti }

procedure TAffidamenti.FormShow(Sender: TObject);
begin
  zqaff.parambyname('AFFIDAMENTO').asinteger:=idaffidamento;
  zqaff.parambyname('DATADA').AsDate:=datada;
  zqaff.parambyname('DATAA').AsDate:=dataa;
  zqaff.open;
  lbaffidamenti.Caption:='Affidamento n.: ' + nomeaffidamento;
end;

procedure TAffidamenti.zqaffAfterScroll(DataSet: TDataSet);
begin
  if zqaff.FieldByName('generato1').AsBoolean then
     dbchgenerato1.Enabled:=false
  else
    dbchgenerato1.Enabled:=true;
  if zqaff.FieldByName('generato2').AsBoolean then
     dbchgenerato2.Enabled:=false
  else
    dbchgenerato2.Enabled:=true;
end;

procedure TAffidamenti.zqaffBeforePost(DataSet: TDataSet);
begin
  zqaff.FieldByName('IDAFFIDAMENTO').AsInteger:=idaffidamento;
end;


procedure TAffidamenti.zupaffBeforeInsertSQLStatement(const Sender: TObject;
  StatementIndex: Integer; out Execute: Boolean);
begin
  //controllo che chgenetrato sia abilitato e spuntato
  if dbchgenerato1.Checked and dbchgenerato1.Enabled then
   begin
     //controllo che i campi obbligatori siano valorizzati
     if (dbeddataval.Text <> '') AND (dbeddataop.Text <> '') AND (dbeduscite.Text <> '') AND (dbeddescr.Text <> '') then
       begin
         //procedo con la creazione del record collegato
         with DataModule1.zq1 do
           begin
             //valorizzo i campi sul dataset e poi faccio il post per inserire il nuovo record.
             Insert;
             FieldByName('IDCONTO').AsInteger:=idconto;
             FieldByName('DATAOP').AsDateTime:=dbeddataop.Date;
             FieldByName('DATAVAL').AsDateTime:=dbeddataval.date;
             FieldByName('ENTRATE').AsCurrency:=StrToCurr(RightStr(dbeduscite.Text,Length(dbeduscite.Text)-4));
             FieldByName('DESCRIZIONE').AsString:=dbeddescr.Text;
             FieldByName('GENERATO').AsBoolean:=true;
             Post;
             CommitUpdates;
           end;
       end
     else
      begin
        //se non lo sono mando messaggio e blocco la procedura
        ShowMessage('Valorizzare i campi necessari alla creazione del movimento collegato, Data operazione, Data valuta, Uscite e Descrizione');
        Execute:=false;
      end;
   end;

end;

procedure TAffidamenti.zupaffBeforeModifySQLStatement(const Sender: TObject;
  StatementIndex: Integer; out Execute: Boolean);
begin
    //controllo che chgenetrato2 sia abilitato e spuntato
  if dbchgenerato2.Checked and dbchgenerato2.Enabled then
   begin
     //controllo che i campi obbligatori siano valorizzati
     if (dbeddataest.Text <> '') AND (dbedentrate.Text <> '') then
       begin
         //procedo con la creazione del record collegato
         with DataModule1.zq1 do
           begin
             //valorizzo i campi sul dataset e faccio il post
             Insert;
             FieldByName('IDCONTO').AsInteger:=idconto;
             FieldByName('DATAOP').AsDateTime:=dbeddataest.Date;
             FieldByName('DATAVAL').AsDateTime:=dbeddataest.date;
             FieldByName('USCITE').AsCurrency:=StrToCurr(RightStr(dbedentrate.Text,Length(dbedentrate.Text)-4));
             FieldByName('DESCRIZIONE').AsString:='Estinzione ' + dbeddescr.Text;
             FieldByName('GENERATO').AsBoolean:=true;
             Post;
             CommitUpdates;
           end;
       end
     else
      begin
        //se non lo sono mando messaggio e blocco la procedura
        ShowMessage('Valorizzare i campi necessari alla creazione del movimento collegato, Data estinzione ed Entrate');
        Execute:=false;
      end;
   end;
end;



procedure TAffidamenti.btcopiavaloreClick(Sender: TObject);
begin
  dbedentrate.Text:=dbeduscite.Text;
end;

end.

