{
//
// Components : TRichEditOleCallback
//
// Copyright (c) 1998 by Woll2Woll Software
//
}

unit wwricholecallback;

interface

uses windows, richedit, activex, comobj, wwrichole, classes, OleCtnrs, Forms, Controls;

type
  TRichEditOleCallback = class(TInterfacedObject, IRichEditOleCallback)
  private
    FOwner: TComponent;
  protected
    function GetNewStorage(out stg: IStorage): HRESULT; stdcall;
    function GetInPlaceContext(out Frame: IOleInPlaceFrame;
         out Doc: IOleInPlaceUIWindow; var FrameInfo: TOleInPlaceFrameInfo): HRESULT; stdcall;
    function ShowContainerUI(fShow: BOOL): HRESULT; stdcall;
    function QueryInsertObject(const clsid: TCLSID; stg: IStorage; cp: longint): HRESULT; stdcall;
    function DeleteObject(oleobj: IOLEObject): HRESULT; stdcall;
    function QueryAcceptData(dataobj: IDataObject; var cfFormat: TClipFormat;
         reco: DWORD; fReally: BOOL; hMetaPict: HGLOBAL): HRESULT; stdcall;
    function ContextSensitiveHelp(fEnterMode: BOOL): HRESULT; stdcall;
    function GetClipboardData(const chrg: TCharRange; reco: DWORD;
         out dataobj: IDataObject): HRESULT; stdcall;
    function GetDragDropEffect(fDrag: BOOL; grfKeyState: DWORD;
         var dwEffect: DWORD): HRESULT; stdcall;
    function GetContextMenu(seltype: Word; oleobj: IOleObject;
         const chrg: TCharRange; var menu: HMENU): HRESULT; stdcall;
  public
    constructor Create(AOwner: TComponent);
  end;


implementation

constructor TRichEditOleCallback.Create(AOwner: TComponent);
begin
  inherited Create;
  FOwner:= AOwner;
end;

function TRichEditOleCallback.GetNewStorage(out stg: IStorage): HRESULT;
var LockBytes: ILockBytes;
begin
  Result:= S_OK;
  try
    OleCheck(CreateILockBytesOnHGlobal(0, True, LockBytes));
    OleCheck(StgCreateDocfileOnILockBytes(LockBytes, STGM_READWRITE
      or STGM_SHARE_EXCLUSIVE or STGM_CREATE, 0, stg));
  except
    Result:= E_OUTOFMEMORY;
  end;
end;

{function GetVCLFrameForm(Form: TCustomForm): IVCLFrameForm;
begin
  if Form.OleFormObject = nil then TOleForm.Create(Form);
  Result := Form.OleFormObject as IVCLFrameForm;
end;
}
//var AFrameInfo: TOleInPlaceFrameInfo;

function TRichEditOleCallback.GetInPlaceContext(out Frame: IOleInPlaceFrame;
  out Doc: IOleInPlaceUIWindow; var FrameInfo: TOleInPlaceFrameInfo): HRESULT;
begin
{  Frame := GetVCLFrameForm(ValidParentForm(FOwner as TControl));
  Doc := nil;

  with AFrameInfo do
  begin
    cb := sizeof(AFrameInfo);
    fMDIApp := False;
    Frame.GetWindow(hWndFrame);
    hAccel := 0;
    cAccelEntries := 0;
  end;
  FrameInfo := AFrameInfo;

  Result:= S_OK;}
  result := E_NOTIMPL;
end;

function TRichEditOleCallback.ShowContainerUI(fShow: BOOL): HRESULT;
begin
  result := E_NOTIMPL;
end;

function TRichEditOleCallback.QueryInsertObject(const clsid: TCLSID; stg: IStorage;
       cp: longint): HRESULT;
begin
  Result:= S_OK;
end;

function TRichEditOleCallback.DeleteObject(oleobj: IOLEObject): HRESULT;
begin
  Result:= S_OK;
end;

function TRichEditOleCallback.QueryAcceptData(dataobj: IDataObject; var cfFormat: TClipFormat;
         reco: DWORD; fReally: BOOL; hMetaPict: HGLOBAL): HRESULT;
begin
  Result:= S_OK;
end;

function TRichEditOleCallback.ContextSensitiveHelp(fEnterMode: BOOL): HRESULT;
begin
  Result:= E_NOTIMPL;
end;

function TRichEditOleCallback.GetClipboardData(const chrg: TCharRange; reco: DWORD;
         out dataobj: IDataObject): HRESULT;
begin
  Result:= E_NOTIMPL;
end;

function TRichEditOleCallback.GetDragDropEffect(fDrag: BOOL; grfKeyState: DWORD;
         var dwEffect: DWORD): HRESULT;
const MK_ALT = $20;
var Effect: DWORD;
begin
  Result:= S_OK;
	if not fDrag then begin // allowable dest effects
		// check for force link
		if ((grfKeyState and (MK_CONTROL or MK_SHIFT)) = (MK_CONTROL or MK_SHIFT)) then
			Effect := DROPEFFECT_LINK
		// check for force copy
		else if ((grfKeyState and MK_CONTROL) = MK_CONTROL) then
			Effect := DROPEFFECT_COPY
		// check for force move
		else if ((grfKeyState and MK_ALT) = MK_ALT) then
			Effect := DROPEFFECT_MOVE
		// default -- recommended action is move
		else
			Effect := DROPEFFECT_MOVE;
		if (Effect and dwEffect <> 0) then // make sure allowed type
			dwEffect := Effect;
  end;
end;

function TRichEditOleCallback.GetContextMenu(seltype: Word; oleobj: IOleObject;
         const chrg: TCharRange; var menu: HMENU): HRESULT;
begin
  Result:= S_OK;
  menu:= 0;
end;


end.
