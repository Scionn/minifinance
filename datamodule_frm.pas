unit datamodule_frm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, ZConnection, ZDataset, ZSqlUpdate,
   inifiles;

type

  { TDataModule1 }

  TDataModule1 = class(TDataModule)
    dsfiditipofido: TDataSource;
    ds1: TDataSource;
    dsanagaff: TDataSource;
    dsanagconti: TDataSource;
    dsanagfidi: TDataSource;
    dsanagtipoaff: TDataSource;
    zc1: TZConnection;
    zq1: TZQuery;
    zqanagaff: TZQuery;
    zqanagconti: TZQuery;
    zqanagfidi: TZQuery;
    zqanagtipoaff: TZQuery;
    zqfiditipofido: TZQuery;
    zrq2: TZReadOnlyQuery;
    zrq1: TZReadOnlyQuery;
    zup1: TZUpdateSQL;
    zupanagaff: TZUpdateSQL;
    zupanagconti: TZUpdateSQL;
    zupfiditipofido: TZUpdateSQL;
    zupanagfidi: TZUpdateSQL;
    zupanagtipoaff: TZUpdateSQL;
    procedure DataModuleCreate(Sender: TObject);
    procedure zc1AfterConnect(Sender: TObject);
    procedure zq1AfterRefresh(DataSet: TDataSet);
    function GetValueIniFile( sezione,parametro:String;fileINI:AnsiString):String;
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.lfm}


procedure Tdatamodule1.zq1AfterRefresh(DataSet: TDataSet);
begin
   zq1.Refresh;
end;

procedure TDataModule1.DataModuleCreate(Sender: TObject);
var PathIniFile: AnsiString; {  flagDatiOk:Boolean;}
begin
     //importo la configurazione del db dal file ini
     PathIniFile := ProgramDirectory + 'settings.ini';
     ZC1.User:=GetValueIniFile('database','user',PathIniFile);
     ZC1.Password:=GetValueIniFile('database','password',PathIniFile);
     ZC1.HostName:=GetValueIniFile('database','hostname',PathIniFile);
     ZC1.Database:=GetValueIniFile('database','database',PathIniFile);
     ZC1.Protocol:=GetValueIniFile('database','protocollo',PathIniFile);

end;

procedure TDataModule1.zc1AfterConnect(Sender: TObject);
begin

end;

function Tdatamodule1.GetValueIniFile(sezione,parametro:String;fileINI:AnsiString):String;
var settings: TIniFile;
begin
   //Apro il file Ini
   settings := TIniFile.Create(fileINI);
   //Se il parametro indicato esiste ritorna il suo valore,
   //altrimenti ritorna una stringa vuota
   if settings.ValueExists(sezione,parametro) then
      GetValueIniFile:=settings.ReadString(sezione,parametro,'')
   else
      GetValueIniFile:='';
   //Libera la memoria assegnata all'istanza settings della classe TIniFile.
   settings.Free;
end;

end.

