{
//
// Components : TwwCustomDialog - used by InfoPower navigator
//
// Copyright (c) 1998 by Woll2Woll Software
//
}

unit wwDialog;

interface

uses Classes, DB;

type
  TwwCustomDialog = class(TComponent)
  protected
//    function GetDataSource: TDataSource; virtual; abstract;
//    procedure SetDataSource(Value: TDataSource); virtual; abstract;
  public
    function Execute: Boolean; virtual; abstract;

    function GetPrimaryDataSet: TDataSet; virtual; abstract;
  end;

  TwwCustomDialogClass = class of TwwCustomDialog;

implementation

end.
