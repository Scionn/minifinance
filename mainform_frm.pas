unit mainform_frm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DateTimePicker, Forms, Controls, Graphics,
  Dialogs, ExtCtrls, DBGrids, StdCtrls, DbCtrls, DBExtCtrls, anagconti_frm,
  estrattoconto_frm, anagaffidamenti_frm, windows, Grids, datamodule_frm,
  affidamenti_frm, ZStoredProcedure;

type

  { Tmainform }

  Tmainform = class(TForm)
    btconti: TButton;
    btconti1: TButton;
    btfidi: TButton;
    bteccontocorrente: TButton;
    btaffidamenti: TButton;
    chinfinito: TCheckBox;
    dbcbaffidamentofiltro: TDBLookupComboBox;
    dbchpresunto: TDBCheckBox;
    datada: TDateTimePicker;
    dataa: TDateTimePicker;
    dbchriconciliato: TDBCheckBox;
    dbeddataop: TDBDateEdit;
    dbeddataval: TDBDateEdit;
    dbeddescrizione: TDBEdit;
    dbedentrate: TDBEdit;
    dbeduscite: TDBEdit;
    dbcbcontocorrente: TDBLookupComboBox;
    dbcbcontocorrentefiltro: TDBLookupComboBox;
    DBNavigator1: TDBNavigator;
    dblbidmovimento: TDBText;
    dbgridmovimenti: TDBGrid;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    procedure btaffidamentiClick(Sender: TObject);
    procedure btcontiClick(Sender: TObject);
    procedure bteccontocorrenteClick(Sender: TObject);
    procedure btfidiClick(Sender: TObject);
    procedure chinfinitoChange(Sender: TObject);

    procedure dbgridmovimentiPrepareCanvas(sender: TObject; DataCol: Integer;
      Column: TColumn; AState: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure GetBuildInfo(var V1, V2, V3, V4: Word);
    function kfVersionInfo: String;
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

procedure Tmainform.GetBuildInfo(var V1, V2, V3, V4: Word);
var
   VerInfoSize, VerValueSize, Dummy : DWORD;
   VerInfo : Pointer;
   VerValue : PVSFixedFileInfo;
begin
VerInfoSize := GetFileVersionInfoSize(PChar(ParamStr(0)), Dummy);
GetMem(VerInfo, VerInfoSize);
GetFileVersionInfo(PChar(ParamStr(0)), 0, VerInfoSize, VerInfo);
VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
With VerValue^ do
begin
  V1 := dwFileVersionMS shr 16;
  V2 := dwFileVersionMS and $FFFF;
  V3 := dwFileVersionLS shr 16;
  V4 := dwFileVersionLS and $FFFF;
end;
FreeMem(VerInfo, VerInfoSize);
end;






function Tmainform.kfVersionInfo: String;
var
  V1,       // Major Version
  V2,       // Minor Version
  V3,       // Release
  V4: Word; // Build Number
begin
  GetBuildInfo(V1, V2, V3, V4);
  Result := IntToStr(V1) + '.'
            + IntToStr(V2) + '.'
            + IntToStr(V3) + '.'
            + IntToStr(V4);
end;


procedure Tmainform.btcontiClick(Sender: TObject);
begin
  anagconti:=Tanagconti.Create(self);
  anagconti.showmodal;
  datamodule1.zqanagconti.close;
  datamodule1.zqanagconti.open;
  datamodule1.zq1.close;
  datamodule1.zq1.open;
end;

procedure Tmainform.btaffidamentiClick(Sender: TObject);
begin
  if dbcbaffidamentofiltro.ItemIndex = -1 then
     begin
       ShowMessage('Selezionare un affidamento');
       Exit;
     end;
    affidamenti:=Taffidamenti.Create(self);
    //passo i parametri
    affidamenti.zqaff.parambyname('AFFIDAMENTO').asinteger:=dbcbaffidamentofiltro.KeyValue;
    affidamenti.zqaff.parambyname('DATADA').AsDate:=datada.Date;
    if chinfinito.Checked then
       affidamenti.zqaff.parambyname('DATAA').AsDate:=IncMonth(now,36)
    else
       affidamenti.zqaff.parambyname('DATAA').AsDate:=dataa.Date;
    affidamenti.zqaff.open;
    affidamenti.lbaffidamenti.Caption:='Affidamento n.: ' + dbcbaffidamentofiltro.Text;
    //mostro la form
    affidamenti.showmodal;
    //aggiorno in dati
    datamodule1.zq1.close;
    datamodule1.zq1.open;
end;

procedure Tmainform.bteccontocorrenteClick(Sender: TObject);
begin
  if dbcbcontocorrentefiltro.ItemIndex = -1 then
     begin
       ShowMessage('Selezionare un conto');
       Exit;
     end;
    estrattoconto:=Testrattoconto.Create(self);
    //passo i parametri
    estrattoconto.IDCONTO:=dbcbcontocorrentefiltro.KeyValue;
    estrattoconto.CONTO:=dbcbcontocorrentefiltro.Text;
    estrattoconto.DATADA:=datada.Date;
    if chinfinito.Checked then
       estrattoconto.DATAA:=IncMonth(now,36)
    else
       estrattoconto.DATAA:=dataa.Date;
    //mostro la form
    estrattoconto.showmodal;
    //aggiorno in dati
    datamodule1.zq1.close;
    datamodule1.zq1.open;
end;

procedure Tmainform.btfidiClick(Sender: TObject);
begin
  anagaffidamenti:=Tanagaffidamenti.Create(self);
  anagaffidamenti.showmodal;
  datamodule1.zqanagaff.close;
  datamodule1.zqanagaff.open;
  datamodule1.zq1.close;
  datamodule1.zq1.open;
end;

procedure Tmainform.chinfinitoChange(Sender: TObject);
begin
  //se è selezionato disabilito il data a
if chinfinito.Checked then
   dataa.Enabled:=false
else
  dataa.Enabled:=true;
end;



procedure Tmainform.dbgridmovimentiPrepareCanvas(sender: TObject;
  DataCol: Integer; Column: TColumn; AState: TGridDrawState);
begin

//controllo se il record è presunto o meno
if datamodule1.zq1.FieldByName('presunto').AsBoolean then
   with sender as TDBGrid do
               begin
                    Canvas.Brush.Color:=clYellow;
               end
//quindi se è riconciliato
else if datamodule1.zq1.FieldByName('riconciliato').AsBoolean then
   with sender as TDBGrid do
               begin
                    Canvas.Brush.Color:=clMoneyGreen;
               end;
end;



procedure Tmainform.FormShow(Sender: TObject);
begin
  //apro i dataset che mi servono
  datamodule1.zq1.open;
  datamodule1.zqanagconti.Open;
  datamodule1.zqanagaff.Open;
  datamodule1.zqanagtipoaff.open;
  datamodule1.zqanagfidi.open;
  DataModule1.zqfiditipofido.open;
  //metto la versione sopra nella barra
  mainform.Caption:='Minifinance v' + kfVersionInfo;
  //inizializzo i selettori data
  datada.Date:=Now;
  dataa.Date:=IncMonth(now,1);
end;




end.

