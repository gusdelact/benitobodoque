object dmMain: TdmMain
  OldCreateOrder = False
  Left = 246
  Top = 107
  Height = 480
  Width = 696
  object apMain: TInterApli
    Apli = 'ICRE01'
    SessionName = 'Default'
    SeguDataBase = dbMain
    ErrorDataBase = dbMain
    DataBase = dbMain
    Version = 'Version 1.0'
    VersionFecha = 'Septiembre 1997'
    VersionEmpresa = 'Interacciones Casa de Bolsa S.A  de C.V'
    VersionInfo = 'Sistema General'
    Left = 104
    Top = 16
  end
  object dbMain: TDatabase
    DatabaseName = 'dbCORP'
    DriverName = 'ORACLE'
    LoginPrompt = False
    Params.Strings = (
      'SERVER NAME=DCORP'
      'USER NAME=ADMIPROD'
      'LANGDRIVER=DBWINWEO'
      'PASSWORD=DESA')
    SessionName = 'Default'
    BeforeConnect = dbMainBeforeConnect
    Left = 24
    Top = 16
  end
  object apMainDWHC: TInterApli
    Apli = 'ICRE01'
    SessionName = 'Default'
    SeguDataBase = dbMainDWHC
    ErrorDataBase = dbMainDWHC
    DataBase = dbMainDWHC
    Version = 'Version 1.0'
    VersionFecha = 'Septiembre 1997'
    VersionEmpresa = 'Interacciones Casa de Bolsa S.A  de C.V'
    VersionInfo = 'Sistema General'
    Left = 104
    Top = 79
  end
  object dbMainDWHC: TDatabase
    DatabaseName = 'dbDWHC'
    DriverName = 'ORACLE'
    LoginPrompt = False
    Params.Strings = (
      'SERVER NAME=DDWHC'
      'USER NAME=ADMIPROD'
      'LANGDRIVER=DBWINWEO'
      'PASSWORD=DESA')
    SessionName = 'Default'
    Left = 24
    Top = 82
  end
end
